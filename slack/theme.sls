# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import slack with context %}

slack-theme:
  cmd.script:
    - onchanges:
      - slack-package-install-pkg-installed
      - slack-package-install-pkg-latest
    - source: .files/make_slack_dark.py