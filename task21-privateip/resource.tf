resource "aws_vpc" "ramya" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "ramya"
    }
  
}
resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.ramya.id
    availability_zone = "ap-northeast-1c"
    cidr_block = "192.168.1.0/24"
  
}
resource "aws_security_group" "bharath" {
    vpc_id = aws_vpc.ramya.id


    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
    

    }
  
}
resource "aws_instance" "lakshmi" {

  ami ="ami-03f4fa076d2981b45" 
  instance_type = "t2.micro" 
  private_ip ="10.10.0.0"
  availability_zone = "ap-northeast-1c"
  key_name = "reddy"
  tags ={
    Name ="lakshmi"
  }
}