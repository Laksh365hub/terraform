variable "instance_names" {
    type = list(string)
    description = "INSTANCE NAMES"
    default = [ "mysql", "backend", "fronted" ]
}

variable "environment" {
    type = string
    default = "prod"
  
}