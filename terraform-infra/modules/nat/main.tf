resource "aws_eip" "this" {
  domain = "vpc"
}

resource "aws_nat_gateway" "this" {
  subnet_id     = var.public_subnet_id
  allocation_id = aws_eip.this.id
}