terraform {
  backend "s3"{
  bucket ="siriteju"
  key ="sirisirisha"
  region = "ap-northeast-1"
  dynamodb_table = "siriteju"
}
}