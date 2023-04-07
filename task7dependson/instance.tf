
resource "aws_instance" "gk" {
  ami           = "ami-03f4fa076d2981b45" 
  instance_type = "t2.micro"
  key_name = "reddy" 
  volume_tags = {
    "volume" = "10"
  }
  
  
 tags = {
    Name = "ramya"
  }
  depends_on = [
    aws_subnet.subnet2
  ]
}
