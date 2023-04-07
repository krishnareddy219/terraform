resource "aws_vpc" "krishna" {
  cidr_block       = "192.168.0.0/16"
 

  tags = {
    Name = "krishna"
  }
}
resource "aws_subnet" "sara" {
  vpc_id     = aws_vpc.krishna.id
  cidr_block = var.subnets_cidr[count.index]
  availability_zone = var.availability_zone[count.index]
  count      = 2

}

resource "aws_internet_gateway" "madhuri" {
  vpc_id = aws_vpc.krishna.id

  tags = {
    Name = "madhuri"
  }
}
resource "aws_route_table" "ram" {
  vpc_id = aws_vpc.krishna.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.madhuri.id
  }
    tags = {
    Name = "ram"
  }
}
resource "aws_route_table_association" "app" {
  subnet_id      = aws_subnet.sara[0].id
  route_table_id = aws_route_table.ram.id
}
resource "aws_route_table_association" "app1" {
  subnet_id      = aws_subnet.sara[1].id
  route_table_id = aws_route_table.ram.id
}
resource "aws_security_group" "ramya" {
  name        = "ramya"
  vpc_id      = aws_vpc.krishna.id

  ingress {
    
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    
  }
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
   
  ami = "ami-0d979355d03fa2522"
  instance_type = "t2.micro"
  key_name = "public"
   associate_public_ip_address = true
      vpc_security_group_ids= [aws_security_group.ramya.id]
      subnet_id = aws_subnet.sara[0].id
      tags = {
        Name = "reddy"
      }

 }
 
 resource "null_resource" "prakash" {
   triggers = {
    running_number = 2.3
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
    "sudo apt install apache2 -y"
    
   ]
 }
 
 }
 resource "aws_instance" "nag1" {
   
  ami = "ami-0d979355d03fa2522"
  instance_type = "t2.micro"
  key_name = "public"
   associate_public_ip_address = true
      vpc_security_group_ids= [aws_security_group.ramya.id]
      subnet_id = aws_subnet.sara[1].id
      tags = {
        Name = "reddy-gaaru"
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
    "sudo apt install nginx -y"
    
   ]
 }
 
 }