
# Security Group allowing only VPC for MongoDB and SSH from public
resource "aws_security_group" "mongo_db_sg" {
  name   = "mongo_db_security_group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]  # Restricts to VPC
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from public internet
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# IAM Role for EC2 Instance with custom EC2 policy and S3 access
resource "aws_iam_role" "mongo_db_role" {
  name = "mongo_db_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "mongo_db_policy" {
  name = "mongo_db_policy"
  role = aws_iam_role.mongo_db_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "ec2:*",
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject", "s3:GetObject"],
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "mongo_db_profile" {
  name = "mongo_db_profile"
  role = aws_iam_role.mongo_db_role.name
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]  
  }
}


# EC2 Instance with MongoDB installation script
resource "aws_instance" "mongo_db_instance" {
  ami           = data.aws_ami.ubuntu.id  # Use a valid MongoDB-compatible Linux AMI
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [aws_security_group.mongo_db_sg.id]
  iam_instance_profile = aws_iam_instance_profile.mongo_db_profile.name
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y mongodb

    sed -i 's/^bind_ip.*/bind_ip = 0.0.0.0/' /etc/mongodb.conf

    systemctl start mongodb
    systemctl enable mongodb

    # Configure MongoDB Authentication
    mongo <<-MONGO_SCRIPT
      use admin
      db.createUser({
        user: "${var.mongo_db_username}",
        pwd: "${var.mongo_db_password}",
        roles: ["root"]
      })
    MONGO_SCRIPT

    # Configure MongoDB for S3 Backup (simplified)
    echo "backup configuration commands here..."
  EOF
}

