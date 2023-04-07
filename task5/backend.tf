terraform {
  backend "s3"{
    bucket = "bharathgaaru"
    key ="krishna"
    region ="ap-northeast-1"
    dynamodb_table ="bharathgaaru"
  }
}