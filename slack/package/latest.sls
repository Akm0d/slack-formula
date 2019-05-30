# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import slack with context %}

include:
  - .install

slack-package-install-pkg-latest:
  pkg.latest:
    - pkgs:
      - {{ slack.pkg }}
