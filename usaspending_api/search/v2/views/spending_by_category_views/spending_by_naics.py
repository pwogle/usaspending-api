from abc import ABCMeta
from typing import List

from django.db.models import QuerySet
from elasticsearch_dsl import A, Q as ES_Q
from usaspending_api.common.helpers.api_helper import alias_response
from usaspending_api.common.elasticsearch.search_wrappers import TransactionSearch
from usaspending_api.search.helpers.spending_by_category_helpers import fetch_naics_description_from_code
from usaspending_api.search.v2.elasticsearch_helper import get_sum_aggregations
from usaspending_api.search.v2.views.spending_by_category_views.base_spending_by_category import (
    BaseSpendingByCategoryViewSet,
)
from usaspending_api.search.v2.views.spending_by_category_views.base_spending_by_category import Category


ALIAS_DICT = {"naics_code": "code", "naics_description": "name"}


class NaicsView(BaseSpendingByCategoryViewSet, metaclass=ABCMeta):

    category = Category(name="naics", primary_field="naics_code")

    def build_elasticsearch_search_with_aggregations(
        self, filter_query: ES_Q, curr_partition: int, num_partitions: int, size: int
    ) -> TransactionSearch:
        # Create filtered Search object
        search = TransactionSearch().filter(filter_query)

        # Define all aggregations needed to build the response
        group_by_naic_code = A(
            "terms",
            field=f"naics_code",
            include={"partition": curr_partition, "num_partitions": num_partitions},
            size=size,
        )
        group_by_naic_description = A(
            "terms",
            field=f"naics_description",
            include={"partition": curr_partition, "num_partitions": num_partitions},
            size=size,
        )

        sum_aggregations = get_sum_aggregations("generated_pragmatic_obligation", self.pagination)
        sum_as_cents = sum_aggregations["sum_as_cents"]
        sum_as_dollars = sum_aggregations["sum_as_dollars"]
        sum_bucket_sort = sum_aggregations["sum_bucket_sort"]

        # Apply the aggregations to TransactionSearch object
        search.aggs.bucket("group_by_naic_code", group_by_naic_code)
        search.aggs["group_by_naic_code"].bucket("group_by_naic_description", group_by_naic_description)
        search.aggs["group_by_naic_code"].metric("sum_as_cents", sum_as_cents).pipeline(
            "sum_as_dollars", sum_as_dollars
        ).pipeline("sum_bucket_sort", sum_bucket_sort)

        return search

    def build_elasticsearch_result(self, response: dict) -> List[dict]:
        results = []
        agency_name_buckets = response.get("group_by_naic_code", {}).get("buckets", [])
        for bucket in agency_name_buckets:
            naics_description_buckets = bucket.get("group_by_naic_description", {}).get("buckets", [])
            results.append(
                {
                    "amount": bucket.get("sum_as_dollars", {"value": 0})["value"],
                    "code": bucket.get("key"),
                    "name": naics_description_buckets[0].get("key") if len(naics_description_buckets) > 0 else None,
                    "id": None,
                }
            )
        return results

    def query_django(self, base_queryset: QuerySet):
        if self.subawards:
            self.raise_not_implemented()
        django_filters = {"naics_code__isnull": False}
        django_values = ["naics_code", "naics_description"]

        queryset = self.common_db_query(base_queryset, django_filters, django_values)

        lower_limit = self.pagination.lower_limit
        upper_limit = self.pagination.upper_limit
        query_results = list(queryset[lower_limit:upper_limit])
        results = alias_response(ALIAS_DICT, query_results)
        for row in results:
            row["id"] = None
            row["name"] = fetch_naics_description_from_code(row["code"], row["name"])
        return query_results
