terraform {
  backend "s3" {
    endpoint                    = "sfo2.digitaloceanspaces.com"
    key                         = "terraform.tfstate"
    bucket                      = "rappiddev-terraform-remote-state"
    region                      = "us-west-1"
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
  }
}

provider "digitalocean" {
  # export DIGITALOCEAN_TOKEN="API TOKEN"
}

resource "digitalocean_droplet" "example_server" {
  image  = "${var.ubuntu}"
  region = "${var.do_nyc1}"
  size   = "512mb"
  name   = "my-first-terraform-droplet"
}
