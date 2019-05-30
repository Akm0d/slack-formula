# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import slack with context %}

slack-package-install-pkg-installed:
  {%- if grains.os_family == 'Debian' %}
  pkgrepo.managed:
    - name: deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main
  {%- endif %}
  pkg.installed:
    - name: {{ slack.pkg }}
