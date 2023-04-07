resource "aws_vpc" "supriya" {
    cidr_block = "192.168.0.0/16"
   tags = {
    Name ="supriya"
   }  
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.supriya.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "public"
  }
}


resource "aws_subnet" "private" {
  vpc_id =aws_vpc.supriya.id
  cidr_block ="192.168.2.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "private"
  }  
}

resource "aws_internet_gateway" "krishna" {
  vpc_id = aws_vpc.supriya.id
  tags = {
    Name = "krishna"
  }
}

resource "aws_route_table" "kiran" {
  vpc_id = aws_vpc.supriya.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id= aws_internet_gateway.krishna.id
  }
 
   tags = {
    Name = "kiran"
  }
}

resource "aws_route_table" "kiran1" {
  vpc_id = aws_vpc.supriya.id
   tags = {
    Name = "kiran1"
  }
}

resource "aws_route_table_association" "public"{
  subnet_id = aws_subnet.public.id
  route_table_id  = aws_route_table.kiran.id
  }

 resource "aws_route_table_association" "private"{
  subnet_id = aws_subnet.private.id
  route_table_id  = aws_route_table.kiran1.id
  }

resource "aws_security_group" "lakshmi" {
 vpc_id = aws_vpc.supriya.id

ingress {
    from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks =  [ "0.0.0.0/0" ]
}
ingress {
    from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks =  [ "0.0.0.0/0" ]
}
ingress {
    from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks =  [ "0.0.0.0/0" ]
}

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

tags = {
    Name = "lakshmi"
}
}

 resource "aws_instance" "ramya" {
   
  ami = "ami-03f4fa076d2981b45"
  count =var.instance_count
  #count = "${terraform.workspace == "dev"?1:0}"
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone = "ap-northeast-1a"
  instance_type = "t2.micro"
   key_name = "siriss"
      vpc_security_group_ids= [aws_security_group.lakshmi.id]
      subnet_id = aws_subnet.public.id

 }
 
 resource "null_resource" "kk" {
   triggers = {
    running_number = var.kk_trigger
   }
 
 

   connection {
     type ="ssh"
     user ="ubuntu"
     private_key = file("C:/Users/Admin/.ssh/id_rsa")
     host = aws_instance.ramya[0].public_ip
     
   }

   provisioner "remote-exec" {
   inline = [
    "sudo apt-get update",
    "sudo apt install apache2 -y"
   ]
 }
 }
 