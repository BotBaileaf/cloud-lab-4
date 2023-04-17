variable "blue-cidr-block" {
  type    = string
  default = "100.64.0.0/16"
}
variable "blue-vpc-name" {
  type    = string
  default = "vpc-blue"
}
variable "blue-subnet-1" {
  type    = string
  default = "100.64.1.0/24"
}
variable "blue-subnet-2" {
  type    = string
  default = "100.64.2.0/24"
}

variable "blue-subnet-3" {
  type    = string
  default = "100.64.3.0/24"
}

variable "green-cidr-block" {
  type    = string
  default = "192.64.0.0/16"
}
variable "green-vpc-name" {
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

