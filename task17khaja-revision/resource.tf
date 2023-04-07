resource "aws_vpc" "ramya" {
    cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ramya"
  }
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.ramya.id
    availability_zone = "ap-northeast-1a"
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = "public"
    }
  
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.ramya.id
    availability_zone = "ap-northeast-1a"
    cidr_block = "192.168.1.0/24"
    tags = {
      Name = "private"
    }
  
}
resource "aws_security_group" "lakshmi" {
    vpc_id = aws_vpc.ramya.id

    ingress  {
        from_port = 22
        to_port = 22
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
        

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
resource "aws_instance" "siri" {
count = var.instance_count
ami = "ami-03f4fa076d2981b45"
instance_type = "t2.micro"
key_name = "reddy"
associate_public_ip_address = var.associative_public_adress
vpc_security_group_ids=[aws_security_group.lakshmi.id]
subnet_id = aws_subnet.public.id
tags = {
  Name = "siri"
}
}
resource "aws_internet_gateway" "lavanya" {
  vpc_id =  aws_vpc.ramya.id
  tags = {
    Name = "lavanya"
  }
}

resource "aws_route_table" "sara" {
  vpc_id =aws_vpc.ramya.id
  
  route = {
    cidr_block="192.168.0.0/16"
    gateway_id =aws_internet_gateway.lavanya.id
  }

     
  tags = {
    Name = "sara"
  }
}
resource "aws_route_table_association" "kiran1" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.sara.id
  
}

resource "aws_route_table_association" "kiran2" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.sara.id
  
}

resource "null_resource" "love" {
triggers  {
  running numbers =var.love_triggers
}  


provisioner "remote-exec" {
  
  connection {
    type = "ssh"
    user = "ubuntu"
    host ="aws_instance.siri.public.ip"
    private_key =file("$/.ssh/id_rsa")
  }
  inline= [
    "sudo apt update",
    "sudo apt install apache2 -y"
  ]

}
}