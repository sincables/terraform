terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}
provider "proxmox" {
  # url del host donde se va a desplegar usando la API
  pm_api_url = "https://192.168.101.15:8006/api2/json"
  # api token id formato: <username>@pam!<tokenId>
  pm_api_token_id = "root@pam!terraform2"
  # secret suministrado al crear el token en proxmox
  pm_api_token_secret = "xxxxxxxxxxx-xxxxxxxx-xxxxxx-xxxxxxx"
  # solo si usa proxmox SSL certificate 
  pm_tls_insecure = true
}

resource "proxmox_lxc" "basic" {

  target_node  = "proxmox"
  hostname     = "TU2204"
  start        = true
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = "una_contraseña"
  unprivileged = true
  ostype       = "ubuntu"

  ssh_public_keys = <<-EOT
    ssh-rsa 
  EOT

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  nameserver = "8.8.8.8"
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.101.102/24" 
    gw     = "192.168.101.1"
   
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y mc"
    ]

  connection {
      type        = "ssh"
      user        = "root"
      host        = "192.168.101.102"
  }
}

}

