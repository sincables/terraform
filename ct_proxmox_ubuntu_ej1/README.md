## Ejemplo de despliegue de contenedores Ubuntu con Terraform en Proxmox

* Parametrizaciones configuradas en archivo variables.tfvars.example

cp variables.tfvars.example variables.tfvars

* Comando inicial terraform

terraform init

* verificacion de estructura

terraform plan -var-file=variables.tfvars

* aplicar infraestructura

terraform apply -var-file=variables.tfvars

## Consideraciones Generales de Proxmox

* En caso de no saber la ubicacion de los templates se puede ejecutar en consola de proxmox la sentencia

pveam list local

* En caso de no estar el tamplate necesario se debera bajarlo con

pveam download local <template-name>

