output "lb" {
  value = aws_lb.this
}

output "target_group" {
  value = aws_lb_target_group.this
}

output "security_group" {
  value = aws_security_group.this
}
