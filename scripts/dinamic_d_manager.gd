extends Area2D
class_name DinamicDManager

const INV = preload("res://resources/items/inventory.tres")

@export var timeline:String
@export var item:Inv_Item

var can_dialogue:bool = true


func Execute_Dialogue():
	Dialogic.start(timeline)
	if item:
		INV._insert(item)


func _on_body_entered(body: Node2D) -> void:
	if can_dialogue:
		can_dialogue = false
		Execute_Dialogue()

func _on_body_exited(body: Node2D) -> void:
	if !can_dialogue:
		can_dialogue = true
