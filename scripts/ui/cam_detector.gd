extends Area2D
class_name CamDetector

@export var audio:AudioManager
@export_enum("Door", "Item_Collect") var SelectedSFX:String
@export var index:int
@export var player_location:Marker2D
@export var cam:Marker2D
@export var scalePlayer:float = 1.0
@export var zoomCam:float = 1.0
@export var new_speed: int = 300


func _on_body_shape_entered(body_rid: RID, body: CharacterBody2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.can_change == true:
		get_parent().get_parent()._teleport(cam, player_location, body, Vector2(scalePlayer,scalePlayer), Vector2(zoomCam,zoomCam), new_speed)
		body.can_change = false
		if SelectedSFX:
			audio.playSFX(SelectedSFX,index)
	else:
		body.can_change = true


func _on_body_shape_exited(body_rid: RID, body: CharacterBody2D, body_shape_index: int, local_shape_index: int) -> void:
	body.can_change = true
