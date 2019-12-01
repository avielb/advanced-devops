FROM mirhosting/centos7-cpanel:latest
RUN yum update
RUN yum install -y jq
RUN yum install -y python36-pip*
RUN pip install boto3
ENV AWS_ACCESS_KEY_ID=AKIA123
ENV AWS_SECRET_ACCESS_KEY=abc123
ADD . /
CMD ["python", "/1.py"]