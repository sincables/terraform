terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}


provider "proxmox" {

  # Url Api Proxmox declarada en archivo de credenciales
  pm_api_url = var.proxmox_api_url

  # api token id creada en proxmox y delcarada en credenciales
  pm_api_token_id = var.proxmox_api_token_id

  # secret suministrada por proxmox al crear el token id y declarada en credenciales
  pm_api_token_secret = var.proxmox_api_token_secret

  # Otra manera de suministrar datos de acceso
  #  pm_password = "***pass-acceso-proxmox***" 
  #  pm_user = "root@pam"
  pm_otp = ""
  pm_tls_insecure = true
}

resource "proxmox_lxc" "nginx-prod" {
  features {
      nesting =  true
  }
  count = 1 # Numeracion relativa a la identificacion del contenedor
  # Variable indicadora de inicio de contenedor luego del despliegue
  start = true
  hostname ="${var.container_name}${count.index + 1}"
  vmid = "444"
  
  network {
      name = "eth0"
      bridge = "vmbr0"
      ip = "dhcp"
      ip6 = "dhcp"
  }
  
  rootfs {
    size = "10G"
    storage = "local-lvm"
  }
  
  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password = "Lester2022!"
  
  target_node = var.proxmox_host
  unprivileged =  true
  
}
