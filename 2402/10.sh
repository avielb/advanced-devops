https://aws.amazon.com/free/?trk=99f831a2-d162-429a-9a77-a89f6b3bd6cd&sc_channel=ps&ef_id=CjwKCAjwravBBhBjEiwAIr30VFu5R1mlsoykXVOAoil2Cl4Wk9SxnhfIe7N6wNqdLRG78NHjgnWYFxoCuRkQAvD_BwE:G:s&s_kwcid=AL!4422!3!645125273267!e!!g!!aws%20free%20tier!19574556890!145779847112&gad_campaignid=19574556890&gbraid=0AAAAADjHtp9HAUr3Qr9MPPKOcorecSLOS&gclid=CjwKCAjwravBBhBjEiwAIr30VFu5R1mlsoykXVOAoil2Cl4Wk9SxnhfIe7N6wNqdLRG78NHjgnWYFxoCuRkQAvD_BwE&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all


https://us-east-1.console.aws.amazon.com/ec2/
sudo -i 
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 nginx:alpine
http://calculator.aws/
docker rm -vf container-name
https://k3s.io/
------------------------------------
curl -sfL https://get.k3s.io | sh - 
# Check for Ready node, takes ~30 seconds 
sudo k3s kubectl get node 
k3s kubectl get pods -A

alias kubectl='k3s kubectl' 
kubectl apply -f https://raw.githubusercontent.com/avielb/advanced-devops/refs/heads/master/monitoring/nginx.yaml
kubectl get pods 

AmazonEC2FullAccess
-----
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0953476d60561c955" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
