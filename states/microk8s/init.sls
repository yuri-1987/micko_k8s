install_snapd:
  pkg.installed:
    - refresh: True
    - pkgs:
      - snapd

install_microk8s:
  cmd.run:
    - name: snap install microk8s --classic --channel=1.23/stable
    - unless: command -v microk8s