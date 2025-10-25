class_name DialogueManager extends Area2D

const INV = preload("res://resources/items/inventory.tres")

@export var sprite:Texture2D
@export var timeline:String
@export var item:Inv_Item

@onready var ended:bool = false

func _ready() -> void:
	if sprite:
		$Sprite2D.texture = sprite
	Dialogic.signal_event.connect(DialogueHandler)

func Execute_Dialogue():
	Dialogic.start(timeline)
	if item:
		INV._insert(item)
	ended = true

func DialogueHandler(i):
	if i == "DialogueEnded" and ended:
		get_tree().queue_delete(self)
