extends Area2D
class_name CamDetector

@export var numCam:int
@export var scaleCam:float = 1.0


func _on_body_shape_entered(body_rid: RID, body: CharacterBody2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.can_change == true:
		get_parent()._teleport(numCam, body, Vector2(scaleCam,scaleCam))
		body.can_change = false


func _on_body_shape_exited(body_rid: RID, body: CharacterBody2D, body_shape_index: int, local_shape_index: int) -> void:
	body.can_change = true
