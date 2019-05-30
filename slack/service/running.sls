# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import template with context %}

include:
  - {{ sls_config_file }}

slack-service-running:
  cmd.run:
    - name: /usr/bin/slack %U
    - runas: {{ user }}
    - bg: True
    - env:
      - LD_PRELOAD: /usr/lib/libcurl.so.3
    - require:
      - pkg: slack

