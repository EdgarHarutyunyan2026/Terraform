variable "region" {
  default = "eu-central-1"
}

variable "ssh_key_name" {
  default = "terraform"
}

variable "key_file_path" {
  description = "Path where the private key file will be saved"
  type        = string
}
