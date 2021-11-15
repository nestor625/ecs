resource "aws_db_instance" "database" {
  allocated_storage    = 5
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.23"
  instance_class       = "db.t2.micro"
  name                 = "ecsdb"
  username             = "root"
  password             = "ecsdb1234"
  db_subnet_group_name = aws_db_subnet_group.databasegroup.name
  parameter_group_name = "default.mysql8.0"
  /* availability_zone = data.aws_availability_zones.available.zone_ids[0] */
  vpc_security_group_ids = [aws_security_group.dbsg.id]
  skip_final_snapshot    = true
  identifier             = "ecsdbdb"
  multi_az               = var.multi_az_db
  publicly_accessible    = true

  tags = {
    name = "testdb"
  }
}


#psql -h ecsdbdb.csmtzmmszgqf.us-east-1.rds.amazonaws.co -p 3306 -U ecsdb postgres