extends Node2D
class_name Act0

func _ready() -> void:
	Dialogic.start("dream1")
	Dialogic.timeline_ended.connect(DialogicHandler)

func DialogicHandler():
	get_tree().change_scene_to_file("res://scenes/acts/act_1.tscn")
