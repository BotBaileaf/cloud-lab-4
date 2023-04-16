module "VPC-BLUE" {
  source = "./VPC/VPC-BLUE"
}

module "VPC-GREEN" {
  source = "./VPC/VPC-GREEN"
}


module "BLUE-SEC-GROUP" {
  source = "./SEC-GROUP"
  vpc-id = module.VPC-BLUE.vpc-blue-id
  vpc-name = module.VPC-BLUE.vpc-blue-name
  aws_subnet-1 = module.VPC-BLUE.vpc-blue-subnet-1
  aws_subnet-2 = module.VPC-BLUE.vpc-blue-subnet-2
  aws_subnet-3 = module.VPC-BLUE.vpc-blue-subnet-3
}

module "GREEN-SEC-GROUP" {
  source = "./SEC-GROUP"
  vpc-id = module.VPC-GREEN.vpc-green-id
  vpc-name = module.VPC-GREEN.vpc-green-name
  aws_subnet-1 = module.VPC-GREEN.vpc-green-subnet-1
  aws_subnet-2 = module.VPC-GREEN.vpc-green-subnet-2
  aws_subnet-3 = module.VPC-GREEN.vpc-green-subnet-3
}

module "BLUE-LOAD-BALANCER" {
  source               = "./High-Availability-Infrastructure"
  aws_subnet-1 = module.VPC-BLUE.vpc-blue-subnet-1
  aws_subnet-2 = module.VPC-BLUE.vpc-blue-subnet-2
  aws_subnet-3 = module.VPC-BLUE.vpc-blue-subnet-3
  security-group = module.BLUE-SEC-GROUP.SG-TF
  vpc-id = module.VPC-BLUE.vpc-blue-id
  vpc-name = module.VPC-BLUE.vpc-blue-name
}

module "GREEN-LOAD-BALANCER" {
  source               = "./High-Availability-Infrastructure"
  aws_subnet-1 = module.VPC-GREEN.vpc-green-subnet-1
  aws_subnet-2 = module.VPC-GREEN.vpc-green-subnet-2
  aws_subnet-3 = module.VPC-GREEN.vpc-green-subnet-3
  security-group = module.GREEN-SEC-GROUP.SG-TF
  vpc-id = module.VPC-GREEN.vpc-green-id
  vpc-name = module.VPC-GREEN.vpc-green-name
}

