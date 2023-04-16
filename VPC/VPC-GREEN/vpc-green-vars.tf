variable "green-cidr-block" {
  type    = string
  default = "192.64.0.0/16"
}
variable "tf-name" {
  type    = string
  default = "vpc-green"
}
variable "green-subnet-1" {
  type    = string
  default = "192.64.1.0/24"
}
variable "green-subnet-2" {
  type    = string
  default = "192.64.2.0/24"
}

variable "green-subnet-3" {
  type    = string
  default = "192.64.3.0/24"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}