resource "aws_iam_role" "instances_iam_role" {
  name = var.cluster_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "instances_iam_instance_profile" {
  name = "${var.cluster_name}-profile"
  role = aws_iam_role.instances_iam_role.name
}

resource "aws_iam_role_policy" "allow_dynamodb" {
  name   = "allow_dynamodb"
  role   = aws_iam_role.instances_iam_role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "BucketAccess",
            "Effect": "Allow",
            "Action": "dynamodb:*",
            "Resource": [
                "${var.table_arn}"
            ]
        }
    ]
}
EOF
}
