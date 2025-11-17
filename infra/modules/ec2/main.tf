resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = "Permitir acesso HTTP e internet"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  user_data              = templatefile("${path.module}/user_data.sh", { docker_image = var.docker_image })
  vpc_security_group_ids = [aws_security_group.sg.id]
}
