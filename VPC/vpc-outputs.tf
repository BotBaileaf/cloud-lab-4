output "vpc-id" {
    value = aws_vpc.vpc.id
}
output "vpc-subnet-1" {
    value = aws_subnet.subnet-1.id
}
output "vpc-subnet-2" {
    value = aws_subnet.subnet-2.id
}
output "vpc-subnet-3" {
    value = aws_subnet.subnet-3.id
}
output "vpc-name" {
    value = aws_vpc.vpc.tags["Name"]
}