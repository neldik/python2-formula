{% from "python/map.jinja" import python2 with context %}
{% from "system/map.jinja" import system_settings with context %}

include:
  - python.python

{% if salt['grains.get']('kernel', '') == 'Windows' %}

{{system_settings.install_directory}}/pip.exe:
  file.symlink:
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
