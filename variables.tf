variable "do_nyc1" {
  description = "Digital Ocean New York Data Center 1"
  default     = "nyc1"
}

variable "do_nyc2" {
  description = "Digital Ocean New York Data Center 2"
  default     = "nyc2"
}

variable "do_nyc3" {
  description = "Digital Ocean New York Data Center 3"
  default     = "nyc3"
}

variable "ubuntu" {
  description = "Default Ubuntu LTS"
  default     = "ubuntu-18-04-x64"
}

# Personal Variables

variable "ssh_fingerprint" {
  description = "Finger print of personal SSH"
  default     = "5b:3a:b0:84:11:16:39:7c:01:c3:53:b7:1e:c3:22:3e"
}
