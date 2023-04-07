resource "aws_db_instance" "madhuri" {
  allocated_storage    = 10
  db_name              = "siri"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "krishna"
  password             = random_password.password.result
 # parameter_group_name = "madhuri.mysql5.7"
  skip_final_snapshot  = true
}

resource "random_password" "password" {
  length           = 10
}