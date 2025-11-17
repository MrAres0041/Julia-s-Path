extends Node2D
class_name Act0

func _ready() -> void:
	Dialogic.start("dream1")
	Dialogic.signal_event.connect(DialogicHandler)

func DialogicHandler(i):
	print("Entró")
	if i == "DialogueEnded":
		get_tree().change_scene_to_file("res://scenes/acts/act_1.tscn")
