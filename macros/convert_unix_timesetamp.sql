{% macro convert_unix_timesetamp(field_name) -%}
timestamp 'epoch' + {{field_name}}::BIGINT * interval '1 second'
{%- endmacro %}