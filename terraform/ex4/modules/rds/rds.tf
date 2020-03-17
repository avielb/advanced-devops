resource "aws_db_instance" "default" {
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "${var.cluster_name}"
  username               = "rds_admin"
  password               = "superpassword"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.rds-sg.id, data.aws_security_group.default-sg.id]
}
