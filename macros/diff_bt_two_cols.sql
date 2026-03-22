{% macro diff_bt_two(x,y) %}

(({{x}}-{{y}})/{{y}})*100

{% endmacro %}