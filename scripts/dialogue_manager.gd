class_name DialogueManager extends Area2D

const INV = preload("res://resources/items/inventory.tres")

@export var timeline:String
@export var item:Inv_Item
@export var autoDestruction:bool = true

@onready var ended:bool = false

func _ready() -> void:
	Dialogic.signal_event.connect(DialogueHandler)

func Execute_Dialogue():
	Dialogic.start(timeline)
	if item:
		INV._insert(item)
	ended = true

func DialogueHandler(i):
	if i == "DialogueEnded" and ended and autoDestruction:
		get_tree().queue_delete(self)
