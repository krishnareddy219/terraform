module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "gk"
  cidr = "192.168.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1b", "ap-northeast-1c"]
  private_subnets = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
  public_subnets  = ["192.168.3.0/24", "192.168.4.0/24", "192.168.5.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    
  }
}
