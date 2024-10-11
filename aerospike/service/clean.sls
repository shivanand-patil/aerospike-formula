# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as aerospike with context %}

aerospike-service-clean-service-dead:
  service.dead:
    - name: {{ aerospike.service.name }}
    - enable: False
