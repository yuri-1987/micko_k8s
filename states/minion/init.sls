minion_conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0640
    - names:
      - /etc/salt/minion.d/masterless.conf:
        - source: salt://{{ slspath }}/files/masterless.conf

minion_service:
  service.disabled:
    - name: salt-minion
    - watch:
      - file: minion_conf