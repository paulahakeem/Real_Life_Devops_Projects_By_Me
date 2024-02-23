output "public_subnet_id1"{
 value = aws_subnet.subnet["public_subnet1"].id   
}
output "public_subnet_id2"{
 value = aws_subnet.subnet["public_subnet2"].id   
}
output "private_subnet_id1"{
 value = aws_subnet.subnet["private_subnet1"].id   
}
output "private_subnet_id2"{
 value = aws_subnet.subnet["private_subnet2"].id   
}
output "secgroup-id" {
value = aws_security_group.secgroup.id    
}

