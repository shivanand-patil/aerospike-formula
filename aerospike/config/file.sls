# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as aerospike with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

aerospike-config-file-file-managed:
  file.managed:
    - name: {{ aerospike.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='aerospike-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ aerospike.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        aerospike: {{ aerospike | json }}
