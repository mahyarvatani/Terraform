resource "aws_placement_group" "placement_group" {
  name     = "${local.name}-placement-group"
  strategy = "spread"
}
