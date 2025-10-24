extends Node2D
class_name CamMovement

@export var cam:Camera2D


func _teleport(nCam:Marker2D, player_location:Marker2D, player:CharacterBody2D, scale_player:Vector2, scaleCam:Vector2):
	if !nCam.global_position==null:
		cam.global_position = nCam.global_position
		cam.zoom = scaleCam
		player.global_position = player_location.global_position
		player.scale = scale_player
	else:
		print(nCam.global_positionw)
