class_name DialogueManager extends Area2D

const INV = preload("res://resources/items/inventory.tres")

@export var timeline:String
@export var item:Inv_Item
@export var autoDestruction:bool = true

var ended:bool = false

func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func Execute_Dialogue():
	Dialogic.start(timeline)
	if item:
		INV._insert(item)
	ended = true

func _on_timeline_ended():
	if autoDestruction and ended:
		get_tree().queue_delete(self)
