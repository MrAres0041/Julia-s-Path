extends State

@onready var player: CharacterBody2D = $"../.." # Ajusta la ruta para llegar a tu Personaje
@onready var animation_tree: AnimationTree = $"../../AnimationTree"

var speed:int

func enter():
	speed = player.speed
	animation_tree["parameters/conditions/idle"] = false
	animation_tree["parameters/conditions/walking"] = true


func physics_update(_delta: float) -> void:
	var input_dir = Input.get_vector("left","right","up","down")
	player.dir = input_dir
	player.velocity = input_dir * speed
	player.move_and_slide()

	if Input.is_action_pressed("run"):
		speed = player.speed * 1.5
	else:
		speed = player.speed


	if input_dir == Vector2.ZERO:
		transitioned.emit(self, "Idle")
		return

	if Input.is_action_just_pressed("inv"):
		transitioned.emit(self, "Inventory")
		return

	if Input.is_action_just_pressed("back"):
		transitioned.emit(self, "Pause")
		return
	
	animation_tree["parameters/Idle/blend_position"] = input_dir
	animation_tree["parameters/walk/blend_position"] = input_dir
