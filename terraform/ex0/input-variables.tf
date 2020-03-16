variable "image_id" {
  type = "string"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-west-1a"]
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = var.image_id
}


```bash
terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]'
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```
