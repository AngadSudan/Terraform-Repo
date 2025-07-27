
resource "aws_instance" "aws_ec2" {
  ami = "aws-xxxxxxx"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.aws_public_subnet.id 
    user_data = <<-EOF
                sudo apt install nginx -y 
                sudo systemctl start nginx
                EOF

    vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
    associate_public_ip_address = true
  tags = {
    Name = "aws-ec2-under-public-subnet"
  }
}