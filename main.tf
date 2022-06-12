#time to launch our AWS resources beginning with the vpc

resource "aws_vpc" "wk_20" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "wk_20"
  }
}

#Now for the ECS or Elastic Container Cluster

resource "aws_ecs_cluster" "wk20_cluster" {
  name = "wk20_cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# here we rin ECS Fargate which lets us focus on building the application without managing the servers. ALL the atributes below are what is required.
module "ecs-fargate" {
  source  = "umotif-public/ecs-fargate/aws"
  version = "~> 6.1.0"

  name_prefix        = "ecs-fargate-example"
  vpc_id             = aws_vpc.wk_20.id
  private_subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

  cluster_id = aws_ecs_cluster.wk20_cluster.id

  task_container_image   = "centos"
  task_definition_cpu    = 256
  task_definition_memory = 512

  task_container_port             = 80
  task_container_assign_public_ip = true

  load_balanced = false

  target_groups = [
    {
      target_group_name = "wk20_tg_fargate"
      container_port    = 80
    }
  ]

  health_check = {
    port = "traffic-port"
    path = "/"
  }

  tags = {
    Environment = "wk20_test"
    Project     = "wk20_Test"
  }
}

# and now for the private subnets

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.wk_20.id
  cidr_block        = var.subnet_1
  availability_zone = "us-east-1a"

  tags = {
    Name = "p_subnet_1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.wk_20.id
  cidr_block        = var.subnet_2
  availability_zone = "us-east-1a"


  tags = {
    Name = "p_subnet_2"
  }
}
