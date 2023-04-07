resource "aws_vpc" "saritha" {
  cidr_block = var.cidr_block
  tags = {
    Name = "saritha"
  }
}

 resource "aws_subnet" "poorna"  {
     count = length(var.cidr_blocks)
    vpc_id = aws_vpc.saritha.id
    cidr_block = var.cidr_blocks[count.index]
    
    tags = {
        Name = var.tags_name[count.index]
    }
 }
