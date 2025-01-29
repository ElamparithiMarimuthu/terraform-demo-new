resource "aws_instance" "Backend" {
  ami                    = var.Backend_ami_id
  instance_type          = var.Backend_instance_type
  vpc_security_group_ids = ["sg-0661f2d826e76d5ce"]
  subnet_id              = "subnet-0b224fb200ae518d6"
  associate_public_ip_address = true
  key_name                    = var.Backend_pem_keyname
  iam_instance_profile        = var.Backend_Attached_instance_profile
  
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  instance_market_options {
    market_type = "spot"
  }

  user_data = file("userdata_backend.sh")  

  tags = {
    Name        = "Backend-qa"
    Environment = "qa-Production"
    Project     = "spotinstance-terraform-demo"
  }
}


