extends Control
class_name GameMenu

func _ready() -> void:
	visible = false

func _on_options_pressed() -> void:
	$AnimationPlayer.play("enter_options")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("back") and !GPlayer.is_talking and !GPlayer.inv_open:
		if GPlayer.pause and !GPlayer.can_walk:
			GPlayer.pause = false
			GPlayer.can_talk = true
			GPlayer.can_walk = true
			visible = false
		else:
			GPlayer.pause = true
			GPlayer.can_talk = false
			GPlayer.can_walk = false
			visible = true

func _on_resume_pressed() -> void:
	visible = false
	GPlayer.can_talk = true
	GPlayer.can_walk = true
	GPlayer.pause = false


func _on_exit_pressed() -> void:
	get_tree().quit()
