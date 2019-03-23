output "ip" {
  value = "${digitalocean_droplet.example_server.ipv4_address}"
}
