resource "aws_vpc" "krishna" {
  cidr_block       = "10.0.0.0/16"
 

  tags = {
    Name = "krishna"
  }
}
resource "aws_subnet" "sara" {
  vpc_id     = aws_vpc.krishna.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sara"
  }
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
  subnet_id      = aws_subnet.sara.id
  route_table_id = aws_route_table.ram.id
}
resource "aws_security_group" "ramya" {
  name        = "ramya"
  vpc_id      = aws_vpc.krishna.id

  ingress {
    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    
  }
    tags = {
    Name = "ramya"
  }
}
resource "aws_instance" "nag" {
   
  ami = "ami-0d979355d03fa2522"
  instance_type = "t2.micro"
   key_name = "reddyimp"
   associate_public_ip_address = true
      vpc_security_group_ids= [aws_security_group.ramya.id]
      subnet_id = aws_subnet.sara.id
      tags = {
        Name = "reddy"
      }

 }
 
 /*resource "aws_db_instance" "madhuri" {
  allocated_storage    = 10
  db_name              = "siri"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "krishna"
  password             = "krishna123"
 # parameter_group_name = "madhuri.mysql5.7"
  skip_final_snapshot  = true
}*/