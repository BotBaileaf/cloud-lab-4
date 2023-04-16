output "vpc-green-id" {
    value = aws_vpc.vpc-green.id
}
output "vpc-green-subnet-1" {
    value = aws_subnet.green-subnet-1.id
}
output "vpc-green-subnet-2" {
    value = aws_subnet.green-subnet-2.id
}
output "vpc-green-subnet-3" {
    value = aws_subnet.green-subnet-3.id
}
output "vpc-green-name" {
    value = aws_vpc.vpc-green.tags["Name"]
}