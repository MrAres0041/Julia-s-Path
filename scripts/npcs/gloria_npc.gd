extends NPC_Sample
class_name GloriaNPC

@onready var anim_tree = $AnimationTree
@onready var playback = anim_tree["parameters/playback"]
@onready var animation_tree: AnimationTree = $AnimationTree

var last_position : Vector2

func _ready() -> void:
	last_position = global_position

func _physics_process(_delta):
	var current_velocity = global_position - last_position
	
	if current_velocity.length() > 0.1:
		var direction = Vector2(sign(current_velocity.x),0)
		_walk_animation(direction, false)
	else:
		_walk_animation(Vector2.ZERO, true)

	last_position = global_position


func _walk_animation(player_dir:Vector2, walking:bool):
	print(player_dir)
	if walking:
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/walk"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/walk"] = true
		
		animation_tree["parameters/Idle/blend_position"] = player_dir
		animation_tree["parameters/Walk/blend_position"] = player_dir
	
