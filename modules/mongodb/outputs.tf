output "mongo_db_instance_id" {
  value = aws_instance.mongo_db_instance.id
}

output "connection_string" {
  value = "mongodb://${var.mongo_db_username}:${var.mongo_db_password}@${aws_instance.mongo_db_instance.public_ip}:27017"
}
