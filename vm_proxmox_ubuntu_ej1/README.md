## Ejemplo de despliegue de Maquina Virtual Ubuntu con Terraform en Proxmox

* Comando inicial terraform*

terraform init

* verificacion de estructura

terraform plan -var-file=variables.tfvars

* aplicar infraestructura

terraform apply -var-file=variables.tfvars

* Para visualizar logs de terraform en consola donde ejecutamos los comandos ejecutamos

export TF_LOG=DEBUG

* luego al ejecutar terraform apply observaremos los LOGS