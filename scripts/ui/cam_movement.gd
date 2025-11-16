extends Node2D
class_name CamMovement

@export var cam:Camera2D
@export var player:Player

var newCamera:Vector2
var newCamScale:Vector2

func _ready() -> void:
		#GPlayer.can_walk = false
		$AnimationPlayer.play("enterScene")

func _teleport(nCam:Marker2D, player_location:Marker2D, player:CharacterBody2D, scale_player:Vector2, scaleCam:Vector2, new_speed:int):
	if !nCam.global_position==null:
		player.global_position = player_location.global_position
		player.scale = scale_player
		GPlayer.can_walk = false
		player.base_speed = new_speed
		newCamera = nCam.global_position
		newCamScale = scaleCam
		_fadeOut(nCam,scaleCam)
	else:
		print(nCam.global_position)
	
func _fadeOut(nCam, scaleCam):
	$AnimationPlayer.play("fadeOut")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fadeOut":
		cam.global_position = newCamera
		cam.zoom = newCamScale
		$AnimationPlayer.play("fadeIn")
	if anim_name == "fadeIn" or "enterScene":
		GPlayer.can_walk = true
