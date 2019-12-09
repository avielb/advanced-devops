//resource "aws_db_instance" "default" {
//  allocated_storage    = 20
//  storage_type         = "gp2"
//  engine               = "mysql"
//  engine_version       = "5.7"
//  instance_class       = "db.t2.micro" # enabled only from db.t2.small
//  name                 = "mydb"
//  username             = "foo"
//  password             = "foobarbaz"
//  parameter_group_name = "default.mysql5.7"
//  kms_key_id = aws_kms_key.key.arn
//  storage_encrypted = true
//}