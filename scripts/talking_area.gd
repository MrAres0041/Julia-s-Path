class_name TalkingArea extends Area2D

@export var Player:Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

var timeline:String
var item:Inv_Item
var dialogue:DialogueManager

func _ready() -> void:
	animation_player.play("interaction")
	sprite_2d.visible = false
