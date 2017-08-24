{% from "python/map.jinja" import python2 with context %}

python2:
  pkg.installed:
    - name: {{ python2.pkg }}
    - version: {{ python2.version }}
#
# {% if salt['grains.get']('kernel', '') == 'Windows' %}
# {{python2.python_path}}:  win_path.exists
# '{{python2.python_path}}\\Scripts':  win_path.exists
# {% endif %}
