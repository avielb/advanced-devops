output "rds_sg" {
  value = aws_security_group.servers-sg.id
}

output "database_url" {
  value = aws_db_instance.default.id
}