# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import template with context %}

slack-service-clean-service-dead:
  ps.pkill:
    - user: {{ user }}
    - name: slack