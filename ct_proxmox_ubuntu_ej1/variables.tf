variable "proxmox_host" {
    default = "proxmox"
}
variable "template_name" {
    default = "ubuntu-22.04-standard_22.04-1_amd64"
}

variable "container_name" {
    default = "ct-"
}

variable "autonumerico" {
    default = "344"
}


variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
}
