{% from "python/map.jinja" import python3 with context %}
{% from "system/map.jinja" import system_settings with context %}

include:
  - python.python3

{% if salt['grains.get']('kernel', '') == 'Windows' %}

Symlink pip into install directory:
  file.symlink:
    - name: {{system_settings.bin_directory}}/pip.exe
    - target: {{python3.pip_cwd}}/pip.exe
    - makedirs: True
    - require:
        - sls: python.python3

{% else %}

python3-pip:
  pkg.installed:
    - name: {{ python3.pip_pkg }}
    - require:
        - sls: python.python3

{% endif %}
