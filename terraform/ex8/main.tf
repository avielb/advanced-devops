provider "aws" {
  region = "us-east-1"
}

variable "name" {
  description = "prefix name for the s3 bucket"
  type        = "string"
}
data aws_subnet "use1c_subnet" {
  availability_zone = "us-east-1c"
}
resource "aws_instance" "web" {
  ami           = "ami-0b898040803850657"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.use1c_subnet.id

}

resource "aws_s3_bucket" "monitor-bucket" {
  depends_on = [aws_instance.web]
  bucket     = "${var.name}-monitor-bucket"
}

resource "aws_s3_bucket_object" "objects" {
  count  = 10
  bucket = aws_s3_bucket.monitor-bucket.bucket
  key    = "key-${count.index}"
  source = "terraform.tfstate"
}

# sha1sum /dev/zero &
