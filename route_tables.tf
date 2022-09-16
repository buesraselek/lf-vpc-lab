resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}


resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.vpc_nat_gateway.id
  }
}
resource "aws_route_table_association" "route-table-public-assoc-a" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.route-table-public.id
}
resource "aws_route_table_association" "route-table-public-assoc-b" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.route-table-public.id
}
resource "aws_route_table_association" "route-table-public-assoc-c" {
  subnet_id      = aws_subnet.public-3.id
  route_table_id = aws_route_table.route-table-public.id
}

resource "aws_route_table_association" "route-table-private-assoc-a" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.route-table-private.id
}
resource "aws_route_table_association" "route-table-private-assoc-b" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.route-table-private.id
}
resource "aws_route_table_association" "route-table-private-assoc-c" {
  subnet_id      = aws_subnet.private-3.id
  route_table_id = aws_route_table.route-table-private.id
}
