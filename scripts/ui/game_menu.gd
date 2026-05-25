extends Control
class_name GameMenu

func _on_options_pressed() -> void:
	$AnimationPlayer.play("enter_options")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_resume_pressed() -> void:
	get_parent().queue_free()
