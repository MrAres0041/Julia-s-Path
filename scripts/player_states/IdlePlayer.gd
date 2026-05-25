extends State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"

@onready var player: CharacterBody2D = $"../.." # Ajusta la ruta para llegar a tu Personaje

func enter() -> void:
	animation_tree["parameters/conditions/idle"] = true
	animation_tree["parameters/conditions/walking"] = false

func physics_update(_delta: float) -> void:
	var input_dir = Input.get_vector("left","right","up","down")
	
	if input_dir != Vector2.ZERO:
		transitioned.emit(self, "Run")
	
	if Input.is_action_just_pressed("inv"):
		transitioned.emit(self, "Inventory")
	
	if Input.is_action_just_pressed("back"):
		transitioned.emit(self, "Pause")
