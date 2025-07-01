- terraform setup

# VPC
topics:
* what is a VPC
* Subnets: private vs public
* route tables
* NAT GW vs Internet gateway
* ENI
* NACL
* security groups

1. run terraform apply - creates VPC 
2. create VPC lambda that prints the lambda's public IP
3. add EC2 iam policy to it's role
4. set it to VPC with private subnet 
5. run code and inspect public IP address that is printed belong to the NAT gateway

# Cloudwatch:
1. run terraform apply - S3 files created -> S3 
2. creates s3 bucket that each file that is created will set a message to SQS 
3. in cloudwatch - go over s3 metrics, SQS metrics 
4. ApproximateNumberOfMessagesVisible, NumberOfMessagesSent, NumberOfMessagesReceived, ApproximateAgeOfOldestMessage
5. Go over the lambda from VPC lesson metrics and log groups
6. create alarms ApproximateNumberOfMessagesVisible > threshold for N periods
7. create dashboard: s3 + sqs + NAT GW metrics
8. add alarm - s3 files, SQS messages sent
