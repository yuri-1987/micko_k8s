minion_conf:
  file.managed:
    - owner: root
    - group: root
    - mode: 0640
    - names:
      - /etc/salt/minion.d/masterless.conf
        - source: salt://{{ slspath }}/files/masterless.conf
      - /etc/salt/minion.d/autoupdate.conf
        - source: salt://{{ slspath }}/files/autoupdate.conf

minion_service:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: minion_cron