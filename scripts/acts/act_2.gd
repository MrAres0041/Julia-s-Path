extends Node2D
class_name Act2

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	Dialogic.start("ending")
	Dialogic.signal_event.connect(DialogicHandler)
	Dialogic.timeline_ended.connect(_OnFinish)

func DialogicHandler(i):
	match i:
		"In":
			animation_player.play("fade_in")
		"Andrew":
			animation_player.play("Andrew")
		"Nina":
			animation_player.play("Nina")
		"Gloria":
			animation_player.play("Gloria")
		"Eric":
			animation_player.play("Eric")
		"BG":
			animation_player.play("BGVanish")
		"Frame":
			animation_player.play("FrameVanish")
		"J1":
			animation_player.play("Julia1")
		"J2":
			animation_player.play("Julia2")
		"J3":
			animation_player.play("Julia3")
		"Out":
			animation_player.play("fade_out")
		"Bed":
			animation_player.play("Bed")

func _OnFinish():
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")
