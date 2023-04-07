variable "region" {
  type =string 
}

variable "cidr_block" {
    type = string
  
}
variable "tag_name" {
    type = string
  
}
variable "cidr_blocks" {
  type = list(string)
  
}
variable "tags_name" {
  type = list(string)
}