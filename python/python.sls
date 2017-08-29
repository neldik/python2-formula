{% from "python/map.jinja" import python2 with context %}

python2:
  pkg.installed:
    - name: {{ python2.pkg }}
    - version: {{ python2.version }}


{% if salt['grains.get']('kernel', '') == 'Windows' %}
Add python to system path:
  module.run:
    - name: win_path.add
    - path: {{python2.python_path}}

Add python scripts to system path:
  module.run:
    - name: win_path.add
    - path: {{python2.pip_cwd}}
{% endif %}
