-- Retrieve subawards from the Broker subaward table.
--
-- Keep an eye out for the {where} clause as this is what's responsible for
-- determining exactly what gets copied to USAspending.  The filter will be
-- substituted in the Django management command.



insert into broker_subaward (
    created_at,
    updated_at,
    id,
    unique_award_key,
    award_id,
    parent_award_id,
    award_amount,
    action_date,
    fy,
    awarding_agency_code,
    awarding_agency_name,
    awarding_sub_tier_agency_c,
    awarding_sub_tier_agency_n,
    awarding_office_code,
    awarding_office_name,
    funding_agency_code,
    funding_agency_name,
    funding_sub_tier_agency_co,
    funding_sub_tier_agency_na,
    funding_office_code,
    funding_office_name,
    awardee_or_recipient_uniqu,
    awardee_or_recipient_legal,
    dba_name,
    ultimate_parent_unique_ide,
    ultimate_parent_legal_enti,
    legal_entity_country_code,
    legal_entity_country_name,
    legal_entity_address_line1,
    legal_entity_city_name,
    legal_entity_state_code,
    legal_entity_state_name,
    legal_entity_zip,
    legal_entity_congressional,
    legal_entity_foreign_posta,
    business_types,
    place_of_perform_city_name,
    place_of_perform_state_code,
    place_of_perform_state_name,
    place_of_performance_zip,
    place_of_perform_congressio,
    place_of_perform_country_co,
    place_of_perform_country_na,
    award_description,
    naics,
    naics_description,
    cfda_numbers,
    cfda_titles,
    subaward_type,
    subaward_report_year,
    subaward_report_month,
    subaward_number,
    subaward_amount,
    sub_action_date,
    sub_awardee_or_recipient_uniqu,
    sub_awardee_or_recipient_legal,
    sub_dba_name,
    sub_ultimate_parent_unique_ide,
    sub_ultimate_parent_legal_enti,
    sub_legal_entity_country_code,
    sub_legal_entity_country_name,
    sub_legal_entity_address_line1,
    sub_legal_entity_city_name,
    sub_legal_entity_state_code,
    sub_legal_entity_state_name,
    sub_legal_entity_zip,
    sub_legal_entity_congressional,
    sub_legal_entity_foreign_posta,
    sub_business_types,
    sub_place_of_perform_city_name,
    sub_place_of_perform_state_code,
    sub_place_of_perform_state_name,
    sub_place_of_performance_zip,
    sub_place_of_perform_congressio,
    sub_place_of_perform_country_co,
    sub_place_of_perform_country_na,
    subaward_description,
    sub_high_comp_officer1_full_na,
    sub_high_comp_officer1_amount,
    sub_high_comp_officer2_full_na,
    sub_high_comp_officer2_amount,
    sub_high_comp_officer3_full_na,
    sub_high_comp_officer3_amount,
    sub_high_comp_officer4_full_na,
    sub_high_comp_officer4_amount,
    sub_high_comp_officer5_full_na,
    sub_high_comp_officer5_amount,
    prime_id,
    internal_id,
    date_submitted,
    report_type,
    transaction_type,
    program_title,
    contract_agency_code,
    contract_idv_agency_code,
    grant_funding_agency_id,
    grant_funding_agency_name,
    federal_agency_name,
    treasury_symbol,
    dunsplus4,
    recovery_model_q1,
    recovery_model_q2,
    compensation_q1,
    compensation_q2,
    high_comp_officer1_full_na,
    high_comp_officer1_amount,
    high_comp_officer2_full_na,
    high_comp_officer2_amount,
    high_comp_officer3_full_na,
    high_comp_officer3_amount,
    high_comp_officer4_full_na,
    high_comp_officer4_amount,
    high_comp_officer5_full_na,
    high_comp_officer5_amount,
    sub_id,
    sub_parent_id,
    sub_federal_agency_id,
    sub_federal_agency_name,
    sub_funding_agency_id,
    sub_funding_agency_name,
    sub_funding_office_id,
    sub_funding_office_name,
    sub_naics,
    sub_cfda_numbers,
    sub_dunsplus4,
    sub_recovery_subcontract_amt,
    sub_recovery_model_q1,
    sub_recovery_model_q2,
    sub_compensation_q1,
    sub_compensation_q2,
    place_of_perform_street,
    sub_place_of_perform_street
    imported
)

select
    cast(created_at as timestamp with time zone),
    cast(updated_at as timestamp with time zone),
    id,
    unique_award_key,
    award_id,
    parent_award_id,
    cast(award_amount as numeric),
    cast(action_date as date),
    fy,
    awarding_agency_code,
    awarding_agency_name,
    awarding_sub_tier_agency_c,
    awarding_sub_tier_agency_n,
    awarding_office_code,
    awarding_office_name,
    funding_agency_code,
    funding_agency_name,
    funding_sub_tier_agency_co,
    funding_sub_tier_agency_na,
    funding_office_code,
    funding_office_name,
    awardee_or_recipient_uniqu,
    awardee_or_recipient_legal,
    dba_name,
    ultimate_parent_unique_ide,
    ultimate_parent_legal_enti,
    legal_entity_country_code,
    legal_entity_country_name,
    legal_entity_address_line1,
    legal_entity_city_name,
    legal_entity_state_code,
    legal_entity_state_name,
    legal_entity_zip,
    legal_entity_congressional,
    legal_entity_foreign_posta,
    business_types,
    place_of_perform_city_name,
    place_of_perform_state_code,
    place_of_perform_state_name,
    place_of_performance_zip,
    place_of_perform_congressio,
    place_of_perform_country_co,
    place_of_perform_country_na,
    award_description,
    naics,
    naics_description,
    cfda_numbers,
    cfda_titles,
    subaward_type,
    cast(subaward_report_year as smallint),
    cast(subaward_report_month as smallint),
    subaward_number,
    cast(subaward_amount as numeric),
    cast(sub_action_date as date),
    sub_awardee_or_recipient_uniqu,
    sub_awardee_or_recipient_legal,
    sub_dba_name,
    sub_ultimate_parent_unique_ide,
    sub_ultimate_parent_legal_enti,
    sub_legal_entity_country_code,
    sub_legal_entity_country_name,
    sub_legal_entity_address_line1,
    sub_legal_entity_city_name,
    sub_legal_entity_state_code,
    sub_legal_entity_state_name,
    sub_legal_entity_zip,
    sub_legal_entity_congressional,
    sub_legal_entity_foreign_posta,
    sub_business_types,
    sub_place_of_perform_city_name,
    sub_place_of_perform_state_code,
    sub_place_of_perform_state_name,
    sub_place_of_performance_zip,
    sub_place_of_perform_congressio,
    sub_place_of_perform_country_co,
    sub_place_of_perform_country_na,
    subaward_description,
    sub_high_comp_officer1_full_na,
    cast(sub_high_comp_officer1_amount as numeric),
    sub_high_comp_officer2_full_na,
    cast(sub_high_comp_officer2_amount as numeric),
    sub_high_comp_officer3_full_na,
    cast(sub_high_comp_officer3_amount as numeric),
    sub_high_comp_officer4_full_na,
    cast(sub_high_comp_officer4_amount as numeric),
    sub_high_comp_officer5_full_na,
    cast(sub_high_comp_officer5_amount as numeric),
    prime_id,
    internal_id,
    cast(date_submitted as timestamp with time zone),
    report_type,
    transaction_type,
    program_title,
    contract_agency_code,
    contract_idv_agency_code,
    grant_funding_agency_id,
    grant_funding_agency_name,
    federal_agency_name,
    treasury_symbol,
    dunsplus4,
    cast(recovery_model_q1 as boolean),
    cast(recovery_model_q2 as boolean),
    cast(compensation_q1 as boolean),
    cast(compensation_q2 as boolean),
    high_comp_officer1_full_na,
    cast(high_comp_officer1_amount as numeric),
    high_comp_officer2_full_na,
    cast(high_comp_officer2_amount as numeric),
    high_comp_officer3_full_na,
    cast(high_comp_officer3_amount as numeric),
    high_comp_officer4_full_na,
    cast(high_comp_officer4_amount as numeric),
    high_comp_officer5_full_na,
    cast(high_comp_officer5_amount as numeric),
    sub_id,
    sub_parent_id,
    sub_federal_agency_id,
    sub_federal_agency_name,
    sub_funding_agency_id,
    sub_funding_agency_name,
    sub_funding_office_id,
    sub_funding_office_name,
    sub_naics,
    sub_cfda_numbers,
    sub_dunsplus4,
    sub_recovery_subcontract_amt,
    cast(sub_recovery_model_q1 as boolean),
    cast(sub_recovery_model_q2 as boolean),
    cast(sub_compensation_q1 as boolean),
    cast(sub_compensation_q2 as boolean),
    place_of_perform_street,
    sub_place_of_perform_street
    false

from
    dblink(
        'broker_server',
        '
            select
                created_at,
                updated_at,
                id,
                unique_award_key,
                award_id,
                parent_award_id,
                award_amount,
                action_date,
                fy,
                awarding_agency_code,
                awarding_agency_name,
                awarding_sub_tier_agency_c,
                awarding_sub_tier_agency_n,
                awarding_office_code,
                awarding_office_name,
                funding_agency_code,
                funding_agency_name,
                funding_sub_tier_agency_co,
                funding_sub_tier_agency_na,
                funding_office_code,
                funding_office_name,
                awardee_or_recipient_uniqu,
                awardee_or_recipient_legal,
                dba_name,
                ultimate_parent_unique_ide,
                ultimate_parent_legal_enti,
                legal_entity_country_code,
                legal_entity_country_name,
                legal_entity_address_line1,
                legal_entity_city_name,
                legal_entity_state_code,
                legal_entity_state_name,
                legal_entity_zip,
                legal_entity_congressional,
                legal_entity_foreign_posta,
                business_types,
                place_of_perform_city_name,
                place_of_perform_state_code,
                place_of_perform_state_name,
                place_of_performance_zip,
                place_of_perform_congressio,
                place_of_perform_country_co,
                place_of_perform_country_na,
                award_description,
                naics,
                naics_description,
                cfda_numbers,
                cfda_titles,
                subaward_type,
                subaward_report_year,
                subaward_report_month,
                subaward_number,
                subaward_amount,
                sub_action_date,
                sub_awardee_or_recipient_uniqu,
                sub_awardee_or_recipient_legal,
                sub_dba_name,
                sub_ultimate_parent_unique_ide,
                sub_ultimate_parent_legal_enti,
                sub_legal_entity_country_code,
                sub_legal_entity_country_name,
                sub_legal_entity_address_line1,
                sub_legal_entity_city_name,
                sub_legal_entity_state_code,
                sub_legal_entity_state_name,
                sub_legal_entity_zip,
                sub_legal_entity_congressional,
                sub_legal_entity_foreign_posta,
                sub_business_types,
                sub_place_of_perform_city_name,
                sub_place_of_perform_state_code,
                sub_place_of_perform_state_name,
                sub_place_of_performance_zip,
                sub_place_of_perform_congressio,
                sub_place_of_perform_country_co,
                sub_place_of_perform_country_na,
                subaward_description,
                sub_high_comp_officer1_full_na,
                sub_high_comp_officer1_amount,
                sub_high_comp_officer2_full_na,
                sub_high_comp_officer2_amount,
                sub_high_comp_officer3_full_na,
                sub_high_comp_officer3_amount,
                sub_high_comp_officer4_full_na,
                sub_high_comp_officer4_amount,
                sub_high_comp_officer5_full_na,
                sub_high_comp_officer5_amount,
                prime_id,
                internal_id,
                date_submitted,
                report_type,
                transaction_type,
                program_title,
                contract_agency_code,
                contract_idv_agency_code,
                grant_funding_agency_id,
                grant_funding_agency_name,
                federal_agency_name,
                treasury_symbol,
                dunsplus4,
                recovery_model_q1,
                recovery_model_q2,
                compensation_q1,
                compensation_q2,
                high_comp_officer1_full_na,
                high_comp_officer1_amount,
                high_comp_officer2_full_na,
                high_comp_officer2_amount,
                high_comp_officer3_full_na,
                high_comp_officer3_amount,
                high_comp_officer4_full_na,
                high_comp_officer4_amount,
                high_comp_officer5_full_na,
                high_comp_officer5_amount,
                sub_id,
                sub_parent_id,
                sub_federal_agency_id,
                sub_federal_agency_name,
                sub_funding_agency_id,
                sub_funding_agency_name,
                sub_funding_office_id,
                sub_funding_office_name,
                sub_naics,
                sub_cfda_numbers,
                sub_dunsplus4,
                sub_recovery_subcontract_amt,
                sub_recovery_model_q1,
                sub_recovery_model_q2,
                sub_compensation_q1,
                sub_compensation_q2,
                place_of_perform_street,
                sub_place_of_perform_street

            from
                subaward

            {where}
        '
    ) as t (
        created_at timestamp with time zone,
        updated_at timestamp with time zone,
        id integer,
        unique_award_key text,
        award_id text,
        parent_award_id text,
        award_amount numeric,
        action_date date,
        fy text,
        awarding_agency_code text,
        awarding_agency_name text,
        awarding_sub_tier_agency_c text,
        awarding_sub_tier_agency_n text,
        awarding_office_code text,
        awarding_office_name text,
        funding_agency_code text,
        funding_agency_name text,
        funding_sub_tier_agency_co text,
        funding_sub_tier_agency_na text,
        funding_office_code text,
        funding_office_name text,
        awardee_or_recipient_uniqu text,
        awardee_or_recipient_legal text,
        dba_name text,
        ultimate_parent_unique_ide text,
        ultimate_parent_legal_enti text,
        legal_entity_country_code text,
        legal_entity_country_name text,
        legal_entity_address_line1 text,
        legal_entity_city_name text,
        legal_entity_state_code text,
        legal_entity_state_name text,
        legal_entity_zip text,
        legal_entity_congressional text,
        legal_entity_foreign_posta text,
        business_types text,
        place_of_perform_city_name text,
        place_of_perform_state_code text,
        place_of_perform_state_name text,
        place_of_performance_zip text,
        place_of_perform_congressio text,
        place_of_perform_country_co text,
        place_of_perform_country_na text,
        award_description text,
        naics text,
        naics_description text,
        cfda_numbers text,
        cfda_titles text,
        subaward_type text,
        subaward_report_year smallint,
        subaward_report_month smallint,
        subaward_number text,
        subaward_amount numeric,
        sub_action_date date,
        sub_awardee_or_recipient_uniqu text,
        sub_awardee_or_recipient_legal text,
        sub_dba_name text,
        sub_ultimate_parent_unique_ide text,
        sub_ultimate_parent_legal_enti text,
        sub_legal_entity_country_code text,
        sub_legal_entity_country_name text,
        sub_legal_entity_address_line1 text,
        sub_legal_entity_city_name text,
        sub_legal_entity_state_code text,
        sub_legal_entity_state_name text,
        sub_legal_entity_zip text,
        sub_legal_entity_congressional text,
        sub_legal_entity_foreign_posta text,
        sub_business_types text,
        sub_place_of_perform_city_name text,
        sub_place_of_perform_state_code text,
        sub_place_of_perform_state_name text,
        sub_place_of_performance_zip text,
        sub_place_of_perform_congressio text,
        sub_place_of_perform_country_co text,
        sub_place_of_perform_country_na text,
        subaward_description text,
        sub_high_comp_officer1_full_na text,
        sub_high_comp_officer1_amount numeric,
        sub_high_comp_officer2_full_na text,
        sub_high_comp_officer2_amount numeric,
        sub_high_comp_officer3_full_na text,
        sub_high_comp_officer3_amount numeric,
        sub_high_comp_officer4_full_na text,
        sub_high_comp_officer4_amount numeric,
        sub_high_comp_officer5_full_na text,
        sub_high_comp_officer5_amount numeric,
        prime_id integer,
        internal_id text,
        date_submitted timestamp with time zone,
        report_type text,
        transaction_type text,
        program_title text,
        contract_agency_code text,
        contract_idv_agency_code text,
        grant_funding_agency_id text,
        grant_funding_agency_name text,
        federal_agency_name text,
        treasury_symbol text,
        dunsplus4 text,
        recovery_model_q1 boolean,
        recovery_model_q2 boolean,
        compensation_q1 boolean,
        compensation_q2 boolean,
        high_comp_officer1_full_na text,
        high_comp_officer1_amount numeric,
        high_comp_officer2_full_na text,
        high_comp_officer2_amount numeric,
        high_comp_officer3_full_na text,
        high_comp_officer3_amount numeric,
        high_comp_officer4_full_na text,
        high_comp_officer4_amount numeric,
        high_comp_officer5_full_na text,
        high_comp_officer5_amount numeric,
        sub_id integer,
        sub_parent_id integer,
        sub_federal_agency_id text,
        sub_federal_agency_name text,
        sub_funding_agency_id text,
        sub_funding_agency_name text,
        sub_funding_office_id text,
        sub_funding_office_name text,
        sub_naics text,
        sub_cfda_numbers text,
        sub_dunsplus4 text,
        sub_recovery_subcontract_amt text,
        sub_recovery_model_q1 boolean,
        sub_recovery_model_q2 boolean,
        sub_compensation_q1 boolean,
        sub_compensation_q2 boolean,
        place_of_perform_street text,
        sub_place_of_perform_street text
    )

on conflict (id) do update set
    created_at = cast(excluded.created_at as timestamp with time zone),
    updated_at = cast(excluded.updated_at as timestamp with time zone),
    unique_award_key = excluded.unique_award_key,
    award_id = excluded.award_id,
    parent_award_id = excluded.parent_award_id,
    award_amount = cast(excluded.award_amount as numeric),
    action_date = cast(excluded.action_date as date),
    fy = excluded.fy,
    awarding_agency_code = excluded.awarding_agency_code,
    awarding_agency_name = excluded.awarding_agency_name,
    awarding_sub_tier_agency_c = excluded.awarding_sub_tier_agency_c,
    awarding_sub_tier_agency_n = excluded.awarding_sub_tier_agency_n,
    awarding_office_code = excluded.awarding_office_code,
    awarding_office_name = excluded.awarding_office_name,
    funding_agency_code = excluded.funding_agency_code,
    funding_agency_name = excluded.funding_agency_name,
    funding_sub_tier_agency_co = excluded.funding_sub_tier_agency_co,
    funding_sub_tier_agency_na = excluded.funding_sub_tier_agency_na,
    funding_office_code = excluded.funding_office_code,
    funding_office_name = excluded.funding_office_name,
    awardee_or_recipient_uniqu = excluded.awardee_or_recipient_uniqu,
    awardee_or_recipient_legal = excluded.awardee_or_recipient_legal,
    dba_name = excluded.dba_name,
    ultimate_parent_unique_ide = excluded.ultimate_parent_unique_ide,
    ultimate_parent_legal_enti = excluded.ultimate_parent_legal_enti,
    legal_entity_country_code = excluded.legal_entity_country_code,
    legal_entity_country_name = excluded.legal_entity_country_name,
    legal_entity_address_line1 = excluded.legal_entity_address_line1,
    legal_entity_city_name = excluded.legal_entity_city_name,
    legal_entity_state_code = excluded.legal_entity_state_code,
    legal_entity_state_name = excluded.legal_entity_state_name,
    legal_entity_zip = excluded.legal_entity_zip,
    legal_entity_congressional = excluded.legal_entity_congressional,
    legal_entity_foreign_posta = excluded.legal_entity_foreign_posta,
    business_types = excluded.business_types,
    place_of_perform_city_name = excluded.place_of_perform_city_name,
    place_of_perform_state_code = excluded.place_of_perform_state_code,
    place_of_perform_state_name = excluded.place_of_perform_state_name,
    place_of_performance_zip = excluded.place_of_performance_zip,
    place_of_perform_congressio = excluded.place_of_perform_congressio,
    place_of_perform_country_co = excluded.place_of_perform_country_co,
    place_of_perform_country_na = excluded.place_of_perform_country_na,
    award_description = excluded.award_description,
    naics = excluded.naics,
    naics_description = excluded.naics_description,
    cfda_numbers = excluded.cfda_numbers,
    cfda_titles = excluded.cfda_titles,
    subaward_type = excluded.subaward_type,
    subaward_report_year = cast(excluded.subaward_report_year as smallint),
    subaward_report_month = cast(excluded.subaward_report_month as smallint),
    subaward_number = excluded.subaward_number,
    subaward_amount = cast(excluded.subaward_amount as numeric),
    sub_action_date = cast(excluded.sub_action_date as date),
    sub_awardee_or_recipient_uniqu = excluded.sub_awardee_or_recipient_uniqu,
    sub_awardee_or_recipient_legal = excluded.sub_awardee_or_recipient_legal,
    sub_dba_name = excluded.sub_dba_name,
    sub_ultimate_parent_unique_ide = excluded.sub_ultimate_parent_unique_ide,
    sub_ultimate_parent_legal_enti = excluded.sub_ultimate_parent_legal_enti,
    sub_legal_entity_country_code = excluded.sub_legal_entity_country_code,
    sub_legal_entity_country_name = excluded.sub_legal_entity_country_name,
    sub_legal_entity_address_line1 = excluded.sub_legal_entity_address_line1,
    sub_legal_entity_city_name = excluded.sub_legal_entity_city_name,
    sub_legal_entity_state_code = excluded.sub_legal_entity_state_code,
    sub_legal_entity_state_name = excluded.sub_legal_entity_state_name,
    sub_legal_entity_zip = excluded.sub_legal_entity_zip,
    sub_legal_entity_congressional = excluded.sub_legal_entity_congressional,
    sub_legal_entity_foreign_posta = excluded.sub_legal_entity_foreign_posta,
    sub_business_types = excluded.sub_business_types,
    sub_place_of_perform_city_name = excluded.sub_place_of_perform_city_name,
    sub_place_of_perform_state_code = excluded.sub_place_of_perform_state_code,
    sub_place_of_perform_state_name = excluded.sub_place_of_perform_state_name,
    sub_place_of_performance_zip = excluded.sub_place_of_performance_zip,
    sub_place_of_perform_congressio = excluded.sub_place_of_perform_congressio,
    sub_place_of_perform_country_co = excluded.sub_place_of_perform_country_co,
    sub_place_of_perform_country_na = excluded.sub_place_of_perform_country_na,
    subaward_description = excluded.subaward_description,
    sub_high_comp_officer1_full_na = excluded.sub_high_comp_officer1_full_na,
    sub_high_comp_officer1_amount = cast(excluded.sub_high_comp_officer1_amount as numeric),
    sub_high_comp_officer2_full_na = excluded.sub_high_comp_officer2_full_na,
    sub_high_comp_officer2_amount = cast(excluded.sub_high_comp_officer2_amount as numeric),
    sub_high_comp_officer3_full_na = excluded.sub_high_comp_officer3_full_na,
    sub_high_comp_officer3_amount = cast(excluded.sub_high_comp_officer3_amount as numeric),
    sub_high_comp_officer4_full_na = excluded.sub_high_comp_officer4_full_na,
    sub_high_comp_officer4_amount = cast(excluded.sub_high_comp_officer4_amount as numeric),
    sub_high_comp_officer5_full_na = excluded.sub_high_comp_officer5_full_na,
    sub_high_comp_officer5_amount = cast(excluded.sub_high_comp_officer5_amount as numeric),
    prime_id = excluded.prime_id,
    internal_id = excluded.internal_id,
    date_submitted = cast(excluded.date_submitted as timestamp with time zone),
    report_type = excluded.report_type,
    transaction_type = excluded.transaction_type,
    program_title = excluded.program_title,
    contract_agency_code = excluded.contract_agency_code,
    contract_idv_agency_code = excluded.contract_idv_agency_code,
    grant_funding_agency_id = excluded.grant_funding_agency_id,
    grant_funding_agency_name = excluded.grant_funding_agency_name,
    federal_agency_name = excluded.federal_agency_name,
    treasury_symbol = excluded.treasury_symbol,
    dunsplus4 = excluded.dunsplus4,
    recovery_model_q1 = cast(excluded.recovery_model_q1 as boolean),
    recovery_model_q2 = cast(excluded.recovery_model_q2 as boolean),
    compensation_q1 = cast(excluded.compensation_q1 as boolean),
    compensation_q2 = cast(excluded.compensation_q2 as boolean),
    high_comp_officer1_full_na = excluded.high_comp_officer1_full_na,
    high_comp_officer1_amount = cast(excluded.high_comp_officer1_amount as numeric),
    high_comp_officer2_full_na = excluded.high_comp_officer2_full_na,
    high_comp_officer2_amount = cast(excluded.high_comp_officer2_amount as numeric),
    high_comp_officer3_full_na = excluded.high_comp_officer3_full_na,
    high_comp_officer3_amount = cast(excluded.high_comp_officer3_amount as numeric),
    high_comp_officer4_full_na = excluded.high_comp_officer4_full_na,
    high_comp_officer4_amount = cast(excluded.high_comp_officer4_amount as numeric),
    high_comp_officer5_full_na = excluded.high_comp_officer5_full_na,
    high_comp_officer5_amount = cast(excluded.high_comp_officer5_amount as numeric),
    sub_id = excluded.sub_id,
    sub_parent_id = excluded.sub_parent_id,
    sub_federal_agency_id = excluded.sub_federal_agency_id,
    sub_federal_agency_name = excluded.sub_federal_agency_name,
    sub_funding_agency_id = excluded.sub_funding_agency_id,
    sub_funding_agency_name = excluded.sub_funding_agency_name,
    sub_funding_office_id = excluded.sub_funding_office_id,
    sub_funding_office_name = excluded.sub_funding_office_name,
    sub_naics = excluded.sub_naics,
    sub_cfda_numbers = excluded.sub_cfda_numbers,
    sub_dunsplus4 = excluded.sub_dunsplus4,
    sub_recovery_subcontract_amt = excluded.sub_recovery_subcontract_amt,
    sub_recovery_model_q1 = cast(excluded.sub_recovery_model_q1 as boolean),
    sub_recovery_model_q2 = cast(excluded.sub_recovery_model_q2 as boolean),
    sub_compensation_q1 = cast(excluded.sub_compensation_q1 as boolean),
    sub_compensation_q2 = cast(excluded.sub_compensation_q2 as boolean),
    place_of_perform_street = excluded.place_of_perform_street,
    sub_place_of_perform_street = excluded.sub_place_of_perform_street,
    imported = false;
