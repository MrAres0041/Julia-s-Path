extends CharacterBody2D
class_name NPC_Sample

@export var isActive:bool = true
@export var spriteFront:Texture2D
@export var spriteBack:Texture2D

var lado:bool = true
var last_position : Vector2


@onready var anim_tree = $AnimationTree
@onready var playback = anim_tree["parameters/playback"]
@onready var animation_tree: AnimationTree = $AnimationTree

func _ready() -> void:
	last_position = global_position


func _physics_process(_delta):
	var current_velocity = global_position - last_position
	
	_ladoVerify()
	
	if current_velocity.length() > 0.1:
		var direction = current_velocity.normalized()
		_walk_animation(direction, false)
	else:
		_walk_animation(Vector2.ZERO, true)

	last_position = global_position


func _walk_animation(player_dir:Vector2, walking:bool):
	if walking:
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/walk"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/walk"] = true
		
		animation_tree["parameters/Idle/blend_position"] = player_dir
		animation_tree["parameters/Walk/blend_position"] = player_dir
		
	if player_dir != Vector2.ZERO:
			if player_dir.y < 0 and lado == true:
				_changeLado(false) 
			elif player_dir.y > 0 and lado == false:
				_changeLado(true)

func _ladoVerify():
	if lado:
		$Sprite2D.texture = spriteFront
	else:
		$Sprite2D.texture = spriteBack


func _NPCVerifier():
	if !isActive:
		$CollisionShape2D.disabled = true
		visible = false
		isActive = true
	else:
		$CollisionShape2D.disabled = false
		visible = true
		isActive = false


func _changeToFront():
	lado = true


func _changeToBack():
	lado = false

func _changeLado(newLado:bool):
	lado = newLado
