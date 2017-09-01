{% from "python/map.jinja" import python2 with context %}
{% from "system/map.jinja" import system_settings with context %}

python2:
  pkg.installed:
    - name: {{ python2.pkg }}
    - version: {{ python2.version }}


{% if salt['grains.get']('kernel', '') == 'Windows' %}

Symlink python into install directory:
  file.symlink:
    - name: {{system_settings.bin_directory}}/python.exe
    - target: {{python2.python_path}}/python.exe
    - makedirs: True
    - onchanges:
        - pkg: python2

Add python to system path:
  module.run:
    - name: win_path.add
    - path: {{python2.python_path}}
    - onchanges:
        - pkg: python2

Add python scripts to system path:
  module.run:
    - name: win_path.add
    - path: {{python2.pip_cwd}}
    - onchanges:
        - pkg: python2
        
{% endif %}
