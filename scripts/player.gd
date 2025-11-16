class_name Player extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

@export var base_speed: int
@export var inv:Inventory
@export var initial_facing:Vector2 = Vector2.ZERO

var speed: int
var input: Vector2 = Vector2.ZERO
var talk_area: Area2D
var can_change: bool = true

func _ready() -> void:
	_setFacing(initial_facing)
	Dialogic.signal_event.connect(DialogicHandler)

func _physics_process(delta: float) -> void:
	speed = base_speed
	var playerInput = GetInput()
	
	$TalkManager.Look_At_This(playerInput)
	
	if Input.is_action_just_pressed("dialogic_default_action") and GPlayer.can_talk and !GPlayer.inv_open and !GPlayer.is_talking:
		talk_area.Execute_Dialogue()
		GPlayer.is_talking = true
		
	if playerInput:
		velocity = speed * playerInput
	else:
		velocity = Vector2.ZERO
	
	if GPlayer.can_walk and !GPlayer.is_talking:
		move_and_slide()
	
	_walk_animation(playerInput)

func GetInput():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()

func DialogicHandler(i):
	if i == "DialogueEnded":
		GPlayer.is_talking = false

func _on_talk_manager_area_entered(area: Area2D) -> void:
	talk_area = area
	GPlayer.can_talk = true

func _on_talk_manager_area_exited(area: Area2D) -> void:
	talk_area = null
	GPlayer.can_talk = false

func _walk_animation(player_dir:Vector2):
	
	if velocity == Vector2.ZERO or GPlayer.is_talking or GPlayer.inv_open or !GPlayer.can_walk:
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/walking"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/walking"] = true
		
		animation_tree["parameters/Idle/blend_position"] = player_dir
		animation_tree["parameters/walk/blend_position"] = player_dir
	

func _setFacing(newInput:Vector2):
	input = newInput
	animation_tree["parameters/Idle/blend_position"] = input
