
# outputs.tf

output "alb_hostname" {
  value = aws_alb.main.dns_name
}

output "dburl" {
  value = aws_db_instance.database.address
}

output "dbname" {
  value = aws_db_instance.database.name
}
