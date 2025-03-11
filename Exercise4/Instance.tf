resource "aws_instance" "web" {
  ami                   = data.aws_ami.amiID.id
  instance_type          = "t2.micro"
  key_name               = "dove-key"
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = var.zone1

  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh/"
  }

  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("dove-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

}




resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}



