resource "aws_db_instance" "default" {
  identifier             = "bookstack"
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "bookstack"
  username               = "bookstack"
  password               = "secret123"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id, data.aws_security_group.default-sg.id]
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = data.aws_subnet_ids.subnets.ids
}