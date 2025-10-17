class_name MainMenu extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("enter")

func _on_play_pressed() -> void:
	print("play")
	animation_player.play("exit")


func _on_exit_pressed() -> void:
	get_tree().quit()
