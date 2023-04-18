# Ejemplo de despliegue de contenedores Ubuntu con Terraform en Proxmox

# Parametrizaciones configuradas en archivo variables.tfvars.example

cp variables.tfvars.example variables.tfvars

# Comando inicial terraform

terraform init

# verificacion de estructura

terraform plan -var-file=variables.tfvars

# aplicar infraestructura

terraform apply -var-file=variables.tfvars

# Para visualizar logs de terraform en consola donde ejecutamos los comandos ejecutamos

export TF_LOG=DEBUG

# luego al ejecutar terraform apply observaremos los LOGS