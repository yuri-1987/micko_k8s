masterless:
  file.managed:
    name: /etc/salt/minion.d/masterless.conf
    owner: root
    group: root
    mode: '0644'
    source: salt://{{ slspath }}/files/masterless.conf

minion_cron:
  file.managed:
    - name: /etc/salt/minion.d/autoupdate.conf
    - source: salt://{{ slspath }}/files/autoupdate.conf
    - user: root
    - group: root
    - mode: 0640

minion_service:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: minion_cron