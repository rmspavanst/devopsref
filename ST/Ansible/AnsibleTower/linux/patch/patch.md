---
# This playbook patches dirty cow

- hosts: all
  gather_facts: true
  tasks:
    - name: Grouping!
      group_by:
        key: "{{ ansible_os_family }}"

- hosts: Debian
  gather_facts: false
  serial: 1
  become: yes
  max_fail_percentage: 0
  tasks:
    - name: New linux-image-generic installation
      apt:
        name: linux-image-generic
        state: latest
        update_cache: yes
        cache_valid_time: 600
      register: upgraded

    - name: reboot
      shell: shutdown -r now
      when: upgraded.changed
      register: reboot

    - name: Wait for the server to come back
      wait_for:
        host: "{{ ansible_ssh_host | default(inventory_hostname) }}"
        delay: 30
        state: started
        search_regex: OpenSSH
        port: 22
      become: false
      when: reboot.changed
      delegate_to: localhost

- hosts: RedHat
  gather_facts: false
  serial: 1
  become: yes
  max_fail_percentage: 0
  tasks:
    - name: Yum update the kernel
      package:
        name: kernel
        state: latest
      register: upgraded

    - name: reboot
      shell: shutdown -r now
      when: upgraded.changed
      register: reboot

    - name: Wait for the server to come back
      wait_for:
        host: "{{ ansible_ssh_host | default(inventory_hostname) }}"
        delay: 30
        state: started
        search_regex: OpenSSH
        port: 22
      become: false
      when: reboot.changed
      delegate_to: localhost