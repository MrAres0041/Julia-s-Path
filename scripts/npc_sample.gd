extends CharacterBody2D
class_name NPC_Sample

var isActive:bool = true

@export var sprite:Texture2D
@export var spriteBack:Texture2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	_changeSprite(true)

func _NPCVerifier():
	if !isActive:
		$CollisionShape2D.disabled = true
		visible = false
		isActive = true
	else:
		$CollisionShape2D.disabled = false
		visible = true
		isActive = false

func _changeSprite(lado:bool):
	if lado:
		$Sprite2D.texture = sprite
	else:
		$Sprite2D.texture = spriteBack


func _animationPlay(anim:String):
	animation_player.play(anim)
