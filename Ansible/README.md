#Ansible

Para la prueba se debe tener instalado un servidor y se debe pasar la key pub

ssh-copy-id -i id_rsa.pub guillermoz@192.168.101.100

Instalacion en Ubuntu

sudo apt-add-repository ppa:ansible/ansible

sudo apt update

sudo apt install ansible

ansible --version

Editar configuracion de los Host  (se define un inventario)

sudo mcedit /etc/ansible/hosts

en mi caso agregue un servidor

[alpine]
192.168.101.100  ansible_ssh_user=root

vamos a realizar la primer prueba, esto es simplemente hacer un ping 

m=modulo ping

ansible alpine -m ping

192.168.101.100 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}

ansible alpine -m shell -a "ls -l /"

192.168.101.100 | CHANGED | rc=0 >>
total 60
lrwxrwxrwx   1 root root     7 Apr 24  2022 bin -> usr/bin
drwxr-xr-x   2 root root  4096 Apr 18  2022 boot
drwxr-xr-x   7 root root   500 May  1 00:06 dev
drwxr-xr-x  69 root root  4096 May  1 00:06 etc
drwxr-xr-x   2 root root  4096 Apr 18  2022 home
lrwxrwxrwx   1 root root     7 Apr 24  2022 lib -> usr/lib
lrwxrwxrwx   1 root root     9 Apr 24  2022 lib32 -> usr/lib32
lrwxrwxrwx   1 root root     9 Apr 24  2022 lib64 -> usr/lib64
lrwxrwxrwx   1 root root    10 Apr 24  2022 libx32 -> usr/libx32
drwx------   2 root root 16384 May  1 00:05 lost+found
drwxr-xr-x   2 root root  4096 Apr 24  2022 media
drwxr-xr-x   2 root root  4096 Apr 24  2022 mnt
drwxr-xr-x   2 root root  4096 Apr 24  2022 opt
dr-xr-xr-x 280 root root     0 May  1 00:06 proc
drwx------   5 root root  4096 May  1 00:17 root
drwxr-xr-x  14 root root   440 May  1 00:21 run
lrwxrwxrwx   1 root root     8 Apr 24  2022 sbin -> usr/sbin
drwxr-xr-x   2 root root  4096 Apr 24  2022 srv
dr-xr-xr-x  13 root root     0 May  1 00:06 sys
drwxrwxrwt  10 root root  4096 May  1 00:21 tmp
drwxr-xr-x  14 root root  4096 Apr 24  2022 usr
drwxr-xr-x  11 root root  4096 Apr 24  2022 var

Play Book (receta)

Creamos un archivo yml , se puede ver el ejemplo1

---
- hosts: alpine
  remote_user: root

  tasks:
  - name: "Test ping"
    ping:

  - name: "mensaje"
    shell: /usr/bin/echo "inicio de mensaje"
    register: mensaje

  - name: "Salida Mensaje"
    debug: msg="{{ mensaje.stdout }}




luego ejecutamos la sentencia en consola

ansible-playbook playbook1.yml

PLAY [alpine] **************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************
ok: [192.168.101.100]

TASK [Test ping] ***********************************************************************************************
ok: [192.168.101.100]

TASK [mensaje] *************************************************************************************************
changed: [192.168.101.100]

TASK [Salida Mensaje] ******************************************************************************************
ok: [192.168.101.100] => {
    "msg": "inicio de mensaje"
}

PLAY RECAP *****************************************************************************************************
192.168.101.100            : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

