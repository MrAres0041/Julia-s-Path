extends CharacterBody2D
class_name NPC_Sample

var isActive:bool = true

@export var sprite:Texture2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	$Sprite2D.texture = sprite
	animation_player.play("idle_l")

func _NPCVerifier():
	if !isActive:
		$CollisionShape2D.disabled = true
		visible = false
		isActive = true
	else:
		$CollisionShape2D.disabled = false
		visible = true
		isActive = false
