{% from "python/map.jinja" import python2 with context %}
{% from "system/map.jinja" import system_settings with context %}

include:
  - python.python

{% if salt['grains.get']('kernel', '') == 'Windows' %}

Symlink pip into install directory:
  file.symlink:
    - name: {{system_settings.bin_directory}}/pip.exe
    - target: {{python2.pip_cwd}}/pip.exe
    - makedirs: True
    - require:
        - sls: python.python

{% else %}

python2-pip:
  pkg.installed:
    - name: {{ python2.pip_pkg }}
    - require:
        - sls: python.python

{% endif %}
