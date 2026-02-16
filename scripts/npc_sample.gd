extends CharacterBody2D
class_name NPC_Sample

@export var isActive:bool = true
@export var sprite:Texture2D
@export var spriteBack:Texture2D
@export var anim_player:AnimationPlayer


func _NPCVerifier():
	if !isActive:
		$CollisionShape2D.disabled = true
		visible = false
		isActive = true
	else:
		$CollisionShape2D.disabled = false
		visible = true
		isActive = false
