extends CharacterBody2D
class_name NPC_Sample

var isActive:bool = true

@export var path_follow:PathFollow2D
@export var speed:float


func _physics_process(delta: float) -> void:
	#path_follow.progress_ratio += speed
	pass

func _NPCVerifier():
	if !isActive:
		$CollisionShape2D.disabled = true
		visible = false
		isActive = true
	else:
		$CollisionShape2D.disabled = false
		visible = true
		isActive = false
