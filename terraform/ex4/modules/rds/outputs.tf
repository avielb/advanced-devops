output "database_sg" {
  value = aws_security_group.rds-sg.id
}

output "database_url" {
  value = aws_db_instance.default.id
}

output "database_port" {
  value = aws_db_instance.default.port
}