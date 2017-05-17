import datetime
from decimal import Decimal
from itertools import cycle
from operator import itemgetter
from unittest.mock import Mock

import pytest
from model_mommy.recipe import Recipe
from model_mommy import mommy

from usaspending_api.awards.models import Award, Transaction
from usaspending_api.common.mixins import AggregateQuerysetMixin
from usaspending_api.common.models import RequestCatalog


@pytest.fixture()
def aggregate_models():
    """Set up data for testing aggregate functions."""
    award_uri = [None, 'yo', 'yo', 'yo']
    award_fain = [None, None, '123']
    award_piid = ['abc', 'def', None]

    award_types = ['U', 'B', '05', 'B']
    start_dates = [
        datetime.date(2016, 7, 13),
        datetime.date(2017, 1, 1),
        datetime.date(
            2018,
            6,
            1, ),
        datetime.date(
            2018,
            1,
            1, ),
    ]
    end_dates = [
        datetime.date(2018, 12, 31), datetime.date(2020, 1, 1),
        datetime.date(2050, 7, 14), datetime.date(2050, 7, 14)
    ]
    obligated_amts = [1000.01, 2000, None, 4000.02]

    # create awards
    award_recipe = Recipe(
        Award,
        piid=cycle(award_piid),
        fain=cycle(award_fain),
        uri=cycle(award_uri),
        type=cycle(award_types),
        period_of_performance_start_date=cycle(start_dates),
        period_of_performance_current_end_date=cycle(end_dates),
        total_obligation=cycle(obligated_amts), )

    award_recipe.make(_quantity=4)

    # make each award parent of the next
    parent = None
    for award in Award.objects.order_by('period_of_performance_start_date'):
        award.parent_award = parent
        award.save()
        parent = award


@pytest.fixture
def aggregate_models_with_nulls():
    mommy.make("awards.TransactionContract", transaction__federal_action_obligation=10, naics="ABCD", _quantity=3)
    mommy.make("awards.TransactionAssistance", transaction__federal_action_obligation=10, cfda__cfda__program_number=10)


@pytest.mark.django_db
def test_agg_fields(monkeypatch, aggregate_models):
    """Test length and field names of aggregate query result."""
    request = Mock()
    request.query_params = {}
    request.data = {'field': 'total_obligation', 'group': 'type'}
    a = AggregateQuerysetMixin()
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=Award.objects.all())

    # Test number of returned recrods
    assert agg.count() == 3

    # Query should return three field names: 'item' - legacy and deprecated, 'aggregate', and 'type'
    fields = agg.first().keys()
    assert len(fields) == 3
    assert 'aggregate' in fields
    assert 'item' in fields
    assert 'type' in fields


@pytest.mark.django_db
@pytest.mark.parametrize('model, request_data, result', [(Award, {
    'field': 'total_obligation',
    'group': 'period_of_performance_start_date'
}, [{
    'item': datetime.date(2017, 1, 1),
    'period_of_performance_start_date': datetime.date(2017, 1, 1),
    'aggregate': Decimal('2000.00')
}, {
    'item': datetime.date(2018, 6, 1),
    'period_of_performance_start_date': datetime.date(2018, 6, 1),
    'aggregate': None
}, {
    'item': datetime.date(2018, 1, 1),
    'period_of_performance_start_date': datetime.date(2018, 1, 1),
    'aggregate': Decimal('4000.02')
}, {
    'item': datetime.date(2016, 7, 13),
    'period_of_performance_start_date': datetime.date(2016, 7, 13),
    'aggregate': Decimal('1000.01')
}]), (Award, {
    'field': 'total_obligation',
    'group': 'period_of_performance_start_date',
    'date_part': 'year'
}, [{
    'item': 2016,
    'aggregate': Decimal('1000.01')
}, {
    'item': 2017,
    'aggregate': Decimal('2000.00')
}, {
    'item': 2018,
    'aggregate': Decimal('4000.02')
}]), (Award, {
    'field': 'total_obligation',
    'group': 'period_of_performance_start_date',
    'date_part': 'month'
}, [{
    'item': 1,
    'aggregate': Decimal('6000.02')
}, {
    'item': 6,
    'aggregate': None
}, {
    'item': 7,
    'aggregate': Decimal('1000.01')
}]), (Award, {
    'field': 'total_obligation',
    'group': 'period_of_performance_start_date',
    'date_part': 'day'
}, [{
    'item': 1,
    'aggregate': Decimal('6000.02')
}, {
    'item': 13,
    'aggregate': Decimal('1000.01')
}])])
def test_aggregate(monkeypatch, aggregate_models, model, request_data, result):
    request = Mock()
    request.query_params = {}
    request.data = request_data
    a = AggregateQuerysetMixin()
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=model.objects.all())

    agg_list = [a for a in agg]
    if 'order' not in request_data:
        # this isn't an 'order by' request, (i.e., we're not testing
        # the result order), so sort the actual and expected results
        # to ensure a good comparison
        agg_list.sort(key=itemgetter('item'))
        result.sort(key=itemgetter('item'))

    assert agg_list == result


_expected_fy_aggregated = [{
    'item': 2016,
    'period_of_performance_start_date__fy': 2016,
    'aggregate': Decimal('1000.01')
}, {
    'item': 2017,
    'period_of_performance_start_date__fy': 2017,
    'aggregate': Decimal('2000.00')
}, {
    'item': 2018,
    'period_of_performance_start_date__fy': 2018,
    'aggregate': Decimal('4000.02')
}]


@pytest.mark.django_db
@pytest.mark.parametrize('model, request_data, expected', [(Award, {
    'field': 'total_obligation',
    'group': 'period_of_performance_start_date__fy'
}, _expected_fy_aggregated)])
def test_aggregate_fy(monkeypatch, aggregate_models, model, request_data,
                      expected):
    request = Mock()
    request.query_params = {}
    request.data = request_data
    a = AggregateQuerysetMixin()
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=model.objects.all())

    agg_list = [a for a in agg]
    if 'order' not in request_data:
        # this isn't an 'order by' request, (i.e., we're not testing
        # the result order), so sort the actual and expected results
        # to ensure a good comparison
        agg_list.sort(key=itemgetter('item'))
        expected.sort(key=itemgetter('item'))

    assert agg_list == expected


_expected_fy_type_aggregated = [{
    'item': 2016,
    'period_of_performance_start_date__fy': 2016,
    'type': 'U',
    'aggregate': Decimal('1000.01')
}, {
    'aggregate': None,
    'period_of_performance_start_date__fy': 2018,
    'type': '05',
    'item': 2018
}, {
    'item': 2017,
    'period_of_performance_start_date__fy': 2017,
    'type': 'B',
    'aggregate': Decimal('2000.00')
}, {
    'item': 2018,
    'period_of_performance_start_date__fy': 2018,
    'type': 'B',
    'aggregate': Decimal('4000.02')
}]

_expected_type_pop_day_aggregated = [{
    'item': None,
    'uri': None,
    'type': 'U',
    'aggregate': Decimal('1000.01')
}, {
    'aggregate': None,
    'uri': 'yo',
    'type': '05',
    'item': 'yo'
}, {
    'item': 'yo',
    'uri': 'yo',
    'type': 'B',
    'aggregate': Decimal('6000.02')
}]


@pytest.mark.django_db
@pytest.mark.parametrize('model, request_data, expected', [(Award, {
    'field': 'total_obligation',
    'group': ['period_of_performance_start_date__fy', 'type']
}, _expected_fy_type_aggregated),
    (Award, {
        'field': 'total_obligation',
        'group': ['uri', 'type']
    }, _expected_type_pop_day_aggregated)])
def test_aggregate_fy_and_type(monkeypatch, aggregate_models, model, request_data,
                               expected):
    request = Mock()
    request.query_params = {}
    request.data = request_data
    a = AggregateQuerysetMixin()
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=model.objects.all())

    agg_list = [a for a in agg]
    if 'order' not in request_data:
        # this isn't an 'order by' request, (i.e., we're not testing
        # the result order), so sort the actual and expected results
        # to ensure a good comparison
        agg_list.sort(key=itemgetter('type', 'item'))
        expected.sort(key=itemgetter('type', 'item'))

    assert agg_list == expected


_expected_parent_fy_aggregated = [{
    'item': None,
    'parent_award__period_of_performance_start_date__fy': None,
    'aggregate': Decimal('1000.01'),
}, {
    'item': 2016,
    'parent_award__period_of_performance_start_date__fy': 2016,
    'aggregate': Decimal('2000.00')
}, {
    'item': 2017,
    'parent_award__period_of_performance_start_date__fy': 2017,
    'aggregate': Decimal('4000.02')
}, {
    'item': 2018,
    'parent_award__period_of_performance_start_date__fy': 2018,
    'aggregate': None
}]


@pytest.mark.django_db
@pytest.mark.parametrize('model, request_data, expected', [(Award, {
    'field': 'total_obligation',
    'group': 'parent_award__period_of_performance_start_date__fy',
    'show_nulls': True
}, _expected_parent_fy_aggregated)])
def test_aggregate_fy_with_traversal(monkeypatch, aggregate_models, model,
                                     request_data, expected):
    request = Mock()
    request.query_params = {}
    request.data = request_data
    a = AggregateQuerysetMixin()
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=model.objects.all())

    def itemsorter(a):
        if a['item'] is None:
            return 0
        return a['item']

    agg_list = [a for a in agg]
    if 'order' not in request_data:
        # this isn't an 'order by' request, (i.e., we're not testing
        # the result order), so sort the actual and expected results
        # to ensure a good comparison
        agg_list.sort(key=itemsorter)
        expected.sort(key=itemsorter)
        # agg_list.sort(key=itemgetter('item'))
        # expected.sort(key=itemgetter('item'))
        #
    assert agg_list == expected


@pytest.mark.django_db
def test_aggregate_nulls(monkeypatch, aggregate_models_with_nulls):
    # Ensure defaults don't return values where all group fields are null
    request = Mock()
    request.query_params = {}
    request.data = {"field": "federal_action_obligation", "group": "assistance_data__cfda__program_number"}
    a = AggregateQuerysetMixin()
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=Transaction.objects.all())
    agg_list = [a for a in agg]

    assert len(agg_list) == 1

    request = Mock()
    request.query_params = {}
    request.data = {"field": "federal_action_obligation", "group": ["assistance_data__cfda__program_number", "contract_data__naics"]}
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=Transaction.objects.all())
    agg_list = [a for a in agg]

    assert len(agg_list) == 2

    request = Mock()
    request.query_params = {}
    request.data = {"field": "federal_action_obligation", "group": "assistance_data__cfda__program_number", "show_nulls": True}
    created, a.req = RequestCatalog.get_or_create_from_request(request)
    agg = a.aggregate(request=request, queryset=Transaction.objects.all())
    agg_list = [a for a in agg]

    assert len(agg_list) == 2
