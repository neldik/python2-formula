{% from "python/map.jinja" import python3 with context %}

python3:
  pkg.installed:
    - name: {{ python3.pkg }}
    - version: {{ python3.version }}

{% if salt['grains.get']('kernel', '') == 'Windows' %}
Add python to system path:
  module.run:
    - name: win_path.add
    - path: {{python3.python_path}}

Add python scripts to system path:
  module.run:
    - name: win_path.add
    - path: {{python3.pip_cwd}}
{% endif %}
