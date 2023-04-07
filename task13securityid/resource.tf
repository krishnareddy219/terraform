resource "aws_vpc" "narendra" {
   cidr_block ="192.168.0.0/16" 
   tags ={
    Name = "narendra"
   } 
}
resource "aws_subnet" "narendra" {
  vpc_id =aws_vpc.narendra.id
  cidr_block = "192.168.1.0/24"
  tags ={
    Name = "narendraanna"
  }
  }
