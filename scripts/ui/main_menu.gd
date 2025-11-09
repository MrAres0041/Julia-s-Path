class_name MainMenu extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var options: Panel = $Panel


func _ready() -> void:
	animation_player.play("enter")
	options.visible = false

func _on_play_pressed() -> void:
	print("play")
	animation_player.play("exit")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_options_pressed() -> void:
	animation_player.play("enter_options")


func _on_back_pressed() -> void:
	animation_player.play("exit_options")
