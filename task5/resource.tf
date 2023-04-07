resource "aws_instance" "lucky" {
 ami =  "ami-03f4fa076d2981b45"
 instance_type = "t2.micro"
 
    key_name = "reddy"
   tags = {
      Name = "bujji"
   } 
 }
