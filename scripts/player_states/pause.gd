extends State

const GAME_MENU = preload("res://scenes/UI/game_menu.tscn")

func enter() -> void:
	var instance = GAME_MENU.instantiate()
	add_child(instance)

func exit() -> void:
	if get_children():
		get_child(0).queue_free()

func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("back") or get_children().size() == 0:
		transitioned.emit(self, "Idle")
