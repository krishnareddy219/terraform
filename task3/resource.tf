resource "aws_vpc" "gk" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "gk"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.gk.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "subnet1"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.gk.id
  cidr_block = "192.168.2.0/24"

  tags = {
    Name = "subnet2"
  }
}
resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.gk.id
  cidr_block = "192.168.3.0/24"

  tags = {
    Name = "subnet3"
  }
}
resource "aws_subnet" "subnet4" {
  vpc_id     = aws_vpc.gk.id
  cidr_block = "192.168.4.0/24"

  tags = {
    Name = "subnet4"
  }
}
resource "aws_subnet" "subnet5" {
  vpc_id     = aws_vpc.gk.id
  cidr_block = "192.168.5.0/24"

  tags = {
    Name = "subnet5"
  }
}