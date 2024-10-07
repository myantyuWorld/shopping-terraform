# AutoScaling EC2起動設定
resource "aws_launch_template" "ecs_launch_config" {
    name_prefix   = "example-"
    image_id      = data.aws_ami.ami.id
    instance_type = "t2.micro"
    key_name               = aws_key_pair.key_pair.id
    lifecycle {
        create_before_destroy = true
    }
}


# AutoScaling Group
resource "aws_autoscaling_group" "ecs_autoscaling_group" {
    name                      = "ecs_autoscaling_group"
    vpc_zone_identifier       = [aws_subnet.public_subnet.id]
    min_size                  = 0
    max_size                  = 1
    desired_capacity          = 1
    health_check_grace_period = 0
    protect_from_scale_in = true
    launch_template {
        id      = aws_launch_template.ecs_launch_config.id
        version = "$Latest"
    }
    lifecycle {
        create_before_destroy = true
    }
    health_check_type         = "EC2"
}