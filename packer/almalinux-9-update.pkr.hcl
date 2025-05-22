variable "os_ver_9" {
  type    = string
  default = "9.5"
}


source "vagrant" "almalinux-9" {
  provider     = "virtualbox"
  communicator = "ssh"

  source_path  = "almalinux/9"
  box_version  = "9.5.20241203"

  box_name     = "mv/alma-9/${formatdate("YYYY-MM-DD", timestamp())}.1"
  output_dir   = "./output-almalinux-9-${formatdate("YYYY-MM-DD-HHmm", timestamp())}"

# skip_package = false
# skip_add     = false
  add_force    = true
  add_clean    = true

  insert_key      = true
  teardown_method = "destroy"  # halt|suspend|destroy
  synced_folder   = "./"
}


build {
  name = "update"

  sources = [
    "source.vagrant.almalinux-9"
  ]

  provisioner "shell" {
#   inline = ["sudo dnf update -y"]
#   inline = ["sudo dnf install ipcalc -y"]
    inline = [
      "/bin/date",
      "/bin/ls -lh /vagrant/*"  ,
      "/bin/ls -lh /vagrant/*/*"
    ]
    expect_disconnect = true
  }

}
