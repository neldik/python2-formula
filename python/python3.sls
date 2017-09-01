{% from "python/map.jinja" import python3 with context %}
{% from "system/map.jinja" import system_settings with context %}

python3:
  pkg.installed:
    - name: {{ python3.pkg }}
    - version: {{ python3.version }}


{% if salt['grains.get']('kernel', '') == 'Windows' %}

Symlink python into install directory:
  file.symlink:
    - name: {{system_settings.bin_directory}}/python.exe
    - target: {{python3.python_path}}/python.exe
    - makedirs: True

Add python to system path:
  module.run:
    - name: win_path.add
    - path: {{python3.python_path}}

Add python scripts to system path:
  module.run:
    - name: win_path.add
    - path: {{python3.pip_cwd}}
{% endif %}
