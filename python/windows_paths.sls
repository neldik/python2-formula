{% from "python/map.jinja" import python2 with context %}
{% if salt['grains.get']('kernel', '') == 'Windows' %}
{{python2.python_path}}:  win_path.exists
{{python2.pip_cwd}}:  win_path.exists
{% endif %}
