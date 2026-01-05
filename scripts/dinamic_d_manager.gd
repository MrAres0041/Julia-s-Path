extends Area2D
class_name DinamicDManager

const INV = preload("res://resources/items/inventory.tres")

@export var timeline:String
@export var item:Inv_Item
@export var autoDestruction:bool = false

var can_dialogue:bool = true

func _ready() -> void:
	Dialogic.signal_event.connect(DialogueHandler)

func Execute_Dialogue():
	Dialogic.start(timeline)
	if item:
		INV._insert(item)

func DialogueHandler(i):
	if i == "DialogueEnded":
		GPlayer.can_walk = true
		GPlayer.can_talk = true
		GPlayer.is_talking = false
		if autoDestruction:
			get_tree().queue_delete(self)


func _on_body_entered(body: Node2D) -> void:
	if can_dialogue:
		GPlayer.can_walk = false
		GPlayer.can_talk = false
		GPlayer.is_talking = true
		can_dialogue = false
		Execute_Dialogue()

func _on_body_exited(body: Node2D) -> void:
	if !can_dialogue:
		can_dialogue = true
