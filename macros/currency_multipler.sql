{% macro currency_multipler_stripe(field_name) -%}
case when upper({{field_name}}) in ('BIF', 'CLP', 'DJF', 'GNF', 'JPY', 'KMF', 'KRW', 'MGA', 'PYG', 'RWF', 'VND', 'VUV', 'XAF', 'XOF', 'XPF') then 1 else 100 end
{%- endmacro %}

{% macro convert_cents_stripe(cents, currency_code) -%}
({{cents}} / case when upper({{currency_code}}) in ('BIF', 'CLP', 'DJF', 'GNF', 'JPY', 'KMF', 'KRW', 'MGA', 'PYG', 'RWF', 'VND', 'VUV', 'XAF', 'XOF', 'XPF') then 1 else 100 end)::numeric(18,2)
{%- endmacro %}

{% macro currency_multipler_chargebee(field_name) -%}
case when upper({{field_name}}) in ('CLP', 'XAF', 'KRW', 'VND', 'XOF', 'JPY') then 1 else 100 end
{%- endmacro %}

{% macro convert_cents_chargebee(cents, currency_code) -%}
({{cents}} / case when upper({{currency_code}}) in ('CLP', 'XAF', 'KRW', 'VND', 'XOF', 'JPY') then 1 else 100 end)::numeric(18,2)
{%- endmacro %}