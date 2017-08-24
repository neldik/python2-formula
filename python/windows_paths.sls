

Print env:
  cmd.run:
    - name: "echo %PATH%"

{% from "python/map.jinja" import python2 with context %}
{% if salt['grains.get']('kernel', '') == 'Windows' %}
{{python2.python_path}}:  win_path.exists
{{python2.pip_cwd}}:  win_path.exists
{% endif %}

configure_salt_paths:
  cmd.run:
    - name: '[Environment]::SetEnvironmentVariable( "PATH", $env:Path + ";C:\Python27;C:\Python27\scripts", [System.EnvironmentVariableTarget]::Process )'
    - shell: powershell

Print env2:
  cmd.run:
    - name: "echo %PATH%"

#
