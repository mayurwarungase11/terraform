module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr_block    = "192.168.0.0/16"
  subnet_cidr_block = "192.168.0.0/23"
  az                = "ap-northeast-1a"
  public_ip         = true
}


module "ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-0f8faa29480e7e6de"
  key_pair          = "3key.pem"
  inst_type         = "t3.micro"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
}
