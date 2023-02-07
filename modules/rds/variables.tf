variable "engine" {
  type    = string
  default = "postgres"
}

variable "instance" {
  type    = string
  default = "db.t3.micro"
}

variable "identifier" {
  type    = string
  default = "cannatech-db"
}

variable "name" {
  type    = string
  default = "cannatech"
}

variable "ingress_port" {
  type    = number
  default = 5432
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  description = "The list of subnet IDs to use for the RDS instance"
  type        = list(string)
}