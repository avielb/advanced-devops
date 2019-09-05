output "sg-id" {
  value = aws_security_group.servers-sg.id
}

output "instance-id" {
  value = aws_instance.web.id
}

output "instance-role-name" {
  value = aws_iam_role.instances_iam_role.name
}

output "instance-profile-name" {
  value = aws_iam_instance_profile.instances_iam_instance_profile.name
}

output "instance-public-address" {
  value = aws_instance.web.public_dns
}