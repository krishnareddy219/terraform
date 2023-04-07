module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "krishna"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
resource "aws_security_group" "ramya" {
  name        = "ramya"
  vpc_id      = module.vpc.vpc_id

  ingress {
    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    
  }
  egress {
    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
    tags = {
    Name = "ramya"
  }
}
resource "aws_key_pair" "public" {
  key_name   = "public"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVZCvqoUhkvsTzezveaCjqzQYbebk0KkQlLHoxfuY7ur1QkjakIZc9ns+4sDP5Skrx8/nYwHlXRj/lS8BBVdlhTJzr6Adm4tqw/CofdFuIDYwHPv7P88yGFaKMVwlalFVY24KOP8Tk7urLcSEhFgh+t5S8vfffBp55PaYIVE913ii3kKgYBIGERBbU1x1ZyIe7td7p7DuF0LXd6b3kCellNwiGv6ACzb1mJzXftDXbcsCkFGdVNnMqs11NNK4EdwyhShaUu2LtUw/IHRxlGIlAbnrsealHPM9NIPjtHqWw0RtAwYdRNjOIQ266rUA9QjRbYDg+i1vKUBnzsVi8sg9xiXhmKQID3HBfptdM/ixKepNls18kMaSg/UFsmsuU9W1GrXmBo2h70Mg/6SLcOgkYotrZMzOuVgu/t/WTZrk6+9Xety3cTpNQx2O7KHnUW82ND0Pv+vkNr8CmyEIZKzade73/6a20KkbIbPyuHus3+6qNPC9xk6clqU70tmGkmzk= admin@KrishnaReddy"
}
resource "aws_instance" "nag" {
   
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name = "public"
   associate_public_ip_address = true
      vpc_security_group_ids= [aws_security_group.ramya.id]
      subnet_id = module.vpc.public_subnets[0]
      tags = {
        Name = "reddy"
      }

 }
 
 resource "null_resource" "prakash" {
   triggers = {
    running_number = 2.4
   }
  
 connection {
     type ="ssh"
     user ="ubuntu"
     private_key = file("C:/Users/Admin/.ssh/id_rsa")
     host = aws_instance.nag.public_ip
     
   }

   provisioner "remote-exec" {
   inline = [
    "sudo apt update",
    "sudo apt install nginx -y"
   ]
 }
 
 }
 resource "aws_instance" "nag1" {
   
  ami = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name = "public"
   associate_public_ip_address = true
      vpc_security_group_ids= [aws_security_group.ramya.id]
      subnet_id = module.vpc.public_subnets[0]
      tags = {
        Name = "reddy1"
      }

 }
 
 resource "null_resource" "prakash1" {
   triggers = {
    running_number = 2.4
   }
  
 connection {
     type ="ssh"
     user ="ubuntu"
     private_key = file("C:/Users/Admin/.ssh/id_rsa")
     host = aws_instance.nag1.public_ip
     
   }

   provisioner "remote-exec" {
   inline = [
    "sudo apt update",
    "sudo apt install apache2 -y"
   ]
 }
 
 }