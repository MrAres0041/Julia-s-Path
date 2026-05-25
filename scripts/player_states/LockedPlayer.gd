extends State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"

func enter() -> void:
	animation_tree["parameters/conditions/idle"] = true
	animation_tree["parameters/conditions/walking"] = false
