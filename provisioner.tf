resource "aws_key_pair" "terra_key" {
  key_name   = "terrakey"
  public_key = file("terrakey.pub")
}


resource "aws_instance" "Second-instance" {
  ami                    = "ami-02f3f602d23f1659d"
  instance_type          = "t2.micro"
  key_name               = "terrakey"
  vpc_security_group_ids = ["sg-0ac0bd52feb88b133"]
  availability_zone      = var.ZONE

  tags = {
    Name    = "Third_instance"
   project = "Provisioner"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/home/ec2-user"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod a+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = "ec2-user"
    private_key = file("terrakey.pem")
    host        = self.public_ip
  }

}