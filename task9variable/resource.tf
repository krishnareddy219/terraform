resource "aws_vpc" "siri" {
cidr_block = var.cidr_block

tags = {
  Name = "var.tag_name"
}
}
resource "aws_subnet" "ramya1" {
 vpc_id = aws_vpc.siri.id
 cidr_block = var.cidr_block

 tags ={
    Name = "var.tag1_subnet1_name"
 } 
}