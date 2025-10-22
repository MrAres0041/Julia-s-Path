extends Node2D
class_name CamMovement

@export var cam:Camera2D
@export var markers:Array[Marker2D]


func _teleport(numCam:int, player:CharacterBody2D, scaleCam:Vector2):
	var new_pos:Vector2
	match numCam:
		0:
			new_pos = markers[1].global_position
		1:
			new_pos = markers[2].global_position
		2:
			new_pos = markers[0].global_position

	cam.global_position = new_pos
	cam.zoom = scaleCam
	player.global_position = new_pos
