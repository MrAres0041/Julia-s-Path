extends Node2D
class_name CamMovement

@export var cam:Camera2D


func _teleport(nCam:Marker2D, player:CharacterBody2D, scaleCam:Vector2):

	cam.global_position = nCam.global_position
	cam.zoom = scaleCam
	player.global_position = nCam.global_position
