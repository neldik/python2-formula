
{% from "python/map.jinja" import python2 with context %}

Print env:
  cmd.run:
    - name: "echo %PATH%"

Install virtualenv:
    pip.installed:
        - name: virtualenv
