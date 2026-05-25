extends State

const INV_UI = preload("res://scenes/UI/inv_ui.tscn")

func enter() -> void:
	var instance = INV_UI.instantiate()
	add_child(instance)

func exit() -> void:
	get_child(0).queue_free()

func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("back") or Input.is_action_just_pressed("inv"):
		transitioned.emit(self, "Idle")
