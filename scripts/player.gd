class_name Player extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

@export var base_speed: int
@export var inv:Inventory

var inv_open:bool = false
var can_talk:bool = false
var speed: int
var input: Vector2 = Vector2.ZERO
var talk_area: Area2D
var can_walk: bool = false
var can_change: bool = true
var last_facing_dir:Vector2 = Vector2(1,0)

func _ready() -> void:
	Dialogic.signal_event.connect(DialogicHandler)
	$AnimationPlayer.play("walk_r")


func _physics_process(delta: float) -> void:
	speed = base_speed
	var playerInput = GetInput()
	
	$TalkManager.Look_At_This(playerInput)
	
	if Input.is_action_just_pressed("dialogic_default_action") and can_talk and !inv_open:
		if !GPlayer.is_talking:
			talk_area.Execute_Dialogue()
			GPlayer.is_talking = true
	if Input.is_action_just_pressed("inv") and !GPlayer.is_talking:
		inv_changer()
	if Input.is_action_just_pressed("back") and inv_open:
		inv_open = false
		can_walk = true

	
	velocity = speed * playerInput
	
	if can_walk and !GPlayer.is_talking:
		move_and_slide()
	
	_walk_animation()

func GetInput():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()

func DialogicHandler(i):
	if i == "DialogueEnded":
		GPlayer.is_talking = false


func _on_talk_manager_area_entered(area: Area2D) -> void:
	talk_area = area
	can_talk = true

func _on_talk_manager_area_exited(area: Area2D) -> void:
	talk_area = null
	can_talk = false

func _on_timer_timeout() -> void:
	can_walk = true

func inv_changer():
	if inv_open:
		inv_open = false
		can_walk = true
	else:
		inv_open = true
		can_walk = false

func _walk_animation():
	var idle = !velocity
	
	if !idle:
		last_facing_dir = velocity
	
	animation_tree.set("parameters/Idle/blend_position", last_facing_dir)
	animation_tree.set("parameters/walk/blend_position", last_facing_dir)
