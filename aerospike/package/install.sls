# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as aerospike with context %}

aerospike-package-install-pkg-installed:
  pkg.installed:
    - name: {{ aerospike.pkg.name }}
