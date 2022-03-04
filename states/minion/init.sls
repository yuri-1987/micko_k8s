clone_git:
  git.latest:
    - name: https://github.com/yuri-1987/micro_k8s.git
    - target: /srv/salt
    - user: root
    - rev: master
    - depth: 1

minion_conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0640
    - names:
      - /etc/salt/minion.d/masterless.conf:
        - source: salt://{{ slspath }}/files/masterless.conf

stop_minion_service:
  service.dead:
    - name: salt-minion
    - enable: False

