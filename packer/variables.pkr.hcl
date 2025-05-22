variable "os_ver_9" {
  description = "AlmaLinux OS 9 version"

  type    = string
  default = "9.5"

  validation {
    condition     = can(regex("9.[0-9]$|9.[1-9][0-9]$", var.os_ver_9))
    error_message = "The os_ver_9 value must be one of released or prereleased versions of AlmaLinux OS 9."
  }
}

variable "build_number" {
  description = "Build number identifier of an image version"

  type    = number
  default = 0
}

locals {
  iso_url_9_x86_64       = "https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/x86_64/AlmaLinux-${var.os_ver_9}-x86_64-boot.iso"
  iso_checksum_9_x86_64  = "file:https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/x86_64/CHECKSUM"

  iso_url_9_aarch64      = "https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/aarch64/AlmaLinux-${var.os_ver_9}-aarch64-boot.iso"
  iso_checksum_9_aarch64 = "file:https://repo.almalinux.org/almalinux/${var.os_ver_9}/isos/aarch64/CHECKSUM"
}


###
### Common
###

variable "headless" {
  description = "Disable GUI"

  type    = bool
  default = true
}

variable "boot_wait" {
  description = "Time to wait before typing boot command"

  type    = string
  default = "10s"
}

variable "cpus" {
  description = "The number of virtual cpus"

  type    = number
  default = 2
}

variable "memory_x86_64" {
  description = "The amount of memory to use when building the x86_64 VM in megabytes"

  type    = number
  default = 3072
}

variable "memory_aarch64" {
  description = "The amount of memory to use when building the AArch64 VM in megabytes"

  type    = number
  default = 4096
}

variable "post_cpus" {
  description = "The number of virtual cpus after the build"

  type    = number
  default = 1
}

variable "post_memory" {
  description = "The number of virtual cpus after the build"

  type    = number
  default = 1024
}

variable "http_directory" {
  description = "Path to a directory to serve kickstart files"

  type    = string
  default = "http"
}

variable "ssh_timeout" {
  description = "The time to wait for SSH to become available"

  type    = string
  default = "3600s"
}

variable "root_shutdown_command" {
  description = "The command to use to gracefully shut down the machine"

  type    = string
  default = "/sbin/shutdown -hP now"
}

###
### Vagrant
###

variable "vagrant_disk_size" {
  description = "The size in MiB of hard disk of VM"

  type    = number
  default = 20000
}

variable "vagrant_shutdown_command" {
  description = "The command to use to gracefully shut down the machine"

  type    = string
  default = "echo vagrant | sudo -S /sbin/shutdown -hP now"
}

variable "vagrant_ssh_username" {
  description = "The username to connect to SSH with"

  type    = string
  default = "vagrant"
}

variable "vagrant_ssh_password" {
  description = "A plaintext password to use to authenticate with SSH"

  type    = string
  default = "vagrant"
}

variable "vagrant_boot_command_9_x86_64" {
  description = "Boot command for AlmaLinux OS 9 Vagrant x86_64"

  type = list(string)

  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-9.vagrant-x86_64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

variable "vagrant_boot_command_9_x86_64_bios" {
  description = "Boot command for x86_64 BIOS"

  type = list(string)
  default = [
    "<tab>",
    "inst.text inst.gpt inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-9.vagrant-x86_64-bios.ks",
    "<enter><wait>",
  ]
}

variable "vagrant_boot_command_9_aarch64" {
  description = "Boot command for AlmaLinux OS 9 Vagrant AArch64"

  type = list(string)
  default = [
    "e",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.text",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-9.vagrant-aarch64.ks",
    "<leftCtrlOn>x<leftCtrlOff>",
  ]
}

