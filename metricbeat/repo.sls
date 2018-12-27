{% set major_version = 5 %}
{%- if salt['pillar.get']('metricbeat:major_version') %}
  {% set major_version = salt['pillar.get']('metricbeat:major_version') | int %}
{%- endif %}

ensure apt can handle https transport for metricbeat:
  pkg.installed:
    - name: apt-transport-https

setup metricbeat repo:
  pkgrepo.managed:
    - name: deb https://artifacts.elastic.co/packages/{{ major_version }}.x/apt stable main
    - file: /etc/apt/sources.list.d/elasticsearch.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
