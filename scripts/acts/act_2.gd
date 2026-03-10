extends Node2D
class_name Act2


func _ready() -> void:
	Dialogic.start("ending")
	Dialogic.signal_event.connect(DialogicHandler)

func DialogicHandler(i):
	if i == "DialogueEnded":
		get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")
