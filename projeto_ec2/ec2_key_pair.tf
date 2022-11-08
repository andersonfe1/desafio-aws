resource "tls_private_key" "Ruby" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "Ruby" {
    key_name = "Ruby"
    public_key = tls_private_key.Ruby.public_key_openssh

    tags = {
      Name = "Ruby",
    }

    depends_on = [
      tls_private_key.Ruby
    ]
}

resource "local_file" "ssh_key" {
    filename = "${aws_key_pair.Ruby.key_name}.pem"
    content = tls_private_key.Ruby.private_key_pem
}