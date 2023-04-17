module "VPC-BLUE" {
  source = "./VPC"
  cidr-block = var.blue-cidr-block
  tf-name = var.blue-vpc-name
  subnet-1 = var.blue-subnet-1
  subnet-2 = var.blue-subnet-2
  subnet-3 = var.blue-subnet-3
  azs = var.azs
}

module "VPC-GREEN" {
  source = "./VPC"
  cidr-block = var.green-cidr-block
  tf-name = var.green-vpc-name
  subnet-1 = var.green-subnet-1
  subnet-2 = var.green-subnet-2
  subnet-3 = var.green-subnet-3
  azs = var.azs
}

module "BLUE-SEC-GROUP" {
  source = "./SEC-GROUP"
  vpc-id = module.VPC-BLUE.vpc-id
  vpc-name = var.blue-vpc-name
  # aws_subnet-1 = var.blue-subnet-1
  # aws_subnet-2 = var.blue-subnet-2
  # aws_subnet-3 = var.blue-subnet-3
}

module "GREEN-SEC-GROUP" {
  source = "./SEC-GROUP"
  vpc-id = module.VPC-GREEN.vpc-id
  vpc-name = var.green-vpc-name
  # aws_subnet-1 = var.green-subnet-1
  # aws_subnet-2 = var.green-subnet-2
  # aws_subnet-3 = var.green-subnet-3
}


module "BLUE-LOAD-BALANCER" {
  source               = "./High-Availability-Infrastructure"
  aws_subnet-1 = module.VPC-BLUE.vpc-subnet-1
  aws_subnet-2 = module.VPC-BLUE.vpc-subnet-2
  aws_subnet-3 = module.VPC-BLUE.vpc-subnet-3
  security-group = module.BLUE-SEC-GROUP.SG-TF
  vpc-id = module.VPC-BLUE.vpc-id
  vpc-name = module.VPC-BLUE.vpc-name
}

module "GREEN-LOAD-BALANCER" {
  source               = "./High-Availability-Infrastructure"
  aws_subnet-1 = module.VPC-GREEN.vpc-subnet-1
  aws_subnet-2 = module.VPC-GREEN.vpc-subnet-2
  aws_subnet-3 = module.VPC-GREEN.vpc-subnet-3
  security-group = module.GREEN-SEC-GROUP.SG-TF
  vpc-id = module.VPC-GREEN.vpc-id
  vpc-name = module.VPC-GREEN.vpc-name
}