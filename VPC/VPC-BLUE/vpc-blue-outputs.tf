output "vpc-blue-id" {
    value = aws_vpc.vpc-blue.id
}
output "vpc-blue-subnet-1" {
    value = aws_subnet.blue-subnet-1.id
}
output "vpc-blue-subnet-2" {
    value = aws_subnet.blue-subnet-2.id
}
output "vpc-blue-subnet-3" {
    value = aws_subnet.blue-subnet-3.id
}
output "vpc-blue-name" {
    value = aws_vpc.vpc-blue.tags["Name"]
}