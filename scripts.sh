For this lab, you can use your terminal or aws cloud shell.

# Create security group for EC2

aws ec2 create-security-group \
    --group-name ec2-sg \
    --description "AWS ec2 SG" \
    --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=ec2-sg}]' \
    --vpc-id "vpc-xxx"

# Add ssh inboud rule 

aws ec2 authorize-security-group-ingress \
    --group-id "sg-xxx" \
    --protocol tcp \
    --port 22 \
    --cidr "myip/32" 

# Add http/80 inboud rule 

aws ec2 authorize-security-group-ingress \
    --group-id "sg-xxx" \
    --protocol tcp \
    --port 80 \
    --cidr "0.0.0.0/0" 

# Create SSH key Pair (Delete existing key pair if exist)

aws ec2 create-key-pair \
    --key-name aws-keypair \
    --key-format "pem" \
    --query "KeyMaterial" \
    --output text > "aws_keypair.pem"

# Check the keypair:

cat aws_keypair.pem

# Create EC2 instance:

aws ec2 run-instances \
    --image-id ami-0d70546e43a941d70 \
    --count 1 \
    --instance-type t2.micro \
    --key-name aws-keypair \
    --security-group-ids sg-xxx \
    --region eu-west-1

# View the instance

aws ec2 describe-instances 

aws ec2 describe-instances \
--query "Reservations[*].Instances[*].{InstanceId:InstanceId,PublicIP:PublicIpAddress}"

aws ec2 describe-instances --instance-id <InstanceId>

# Connect to EC2 instance

ssh -i "aws-keypair.pem" ec2-user@PublicIpAddress

# Install packages:

sudo yum update -y
sudo yum install httpd -y
sudo yum install php -y
sudo yum install php-pgsql -y

# Create security groupe for RDS database:


aws ec2 create-security-group \
    --group-name rds-sg \
    --description "AWS RDS SG" \
    --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=rds-sg}]' \
    --vpc-id "vpc-xxx"

aws rds create-db-instance 
    --db-instance-identifier pgdbinstance \
    --allocated-storage 20 \ 
    --db-instance-class db.t2.small \
    --engine postgres \
    --master-username masterawsuser \
    --master-user-password masteruserpassword