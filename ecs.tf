/* SSH key pair */
resource "aws_key_pair" "ecs" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.key_file)}"
}

/**
 * Launch configuration used by autoscaling group
 */
resource "aws_launch_configuration" "ecs" {
  name                 = "ecs"
  image_id             = "${lookup(var.amis, var.region)}"
  /* @todo - split out to a variable */
  instance_type        = "${var.instance_type}"
  key_name             = "${aws_key_pair.ecs.key_name}"
  security_groups      = ["${aws_security_group.ecs.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.ecs.id}"
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
}

/**
 * Autoscaling group.
 */
resource "aws_autoscaling_group" "ecs" {
  name                 = "ecs-asg"
  /* @todo - split out to a variable */
  availability_zones   = ["${var.availability_zone}"]
  launch_configuration = "${aws_launch_configuration.ecs.name}"
  /* @todo - variablize */
  min_size             = 1
  max_size             = 10
  desired_capacity     = 1
  vpc_zone_identifier  = ["${aws_subnet.public.id}"]
}

/* ecs service cluster */
resource "aws_ecs_cluster" "default" {
  name = "${var.ecs_cluster_name}"
}
