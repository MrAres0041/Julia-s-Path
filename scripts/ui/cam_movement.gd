extends Node2D
class_name CamMovement

@export var cam:Camera2D
@export var markers:Array[Marker2D]

func _ready() -> void:
	cam.global_position = markers[0].global_position
	cam.zoom = Vector2(2,2)

func _teleport(numCam:int, player:CharacterBody2D):
	var new_pos:Vector2
	match numCam:
		0:
			new_pos = markers[1].global_position
		1:
			new_pos = markers[2].global_position
		2:
			new_pos = markers[0].global_position

	cam.global_position = new_pos
	player.global_position = new_pos
