class_name DialogueManager extends Area2D

const INV = preload("res://resources/items/inventory.tres")
const PADLOCKER = preload("res://scenes/UI/padlocker.tscn")

@export var CallListed:CallList

@export var timeline:String
@export var item:Inv_Item
@export var autoDestruction:bool = true

var is_active: bool = false


func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	if !is_active:
		return
	
	if item:
		var delivered_item = item
		item = null 
		INV._insert(delivered_item)
		
	if autoDestruction:
		queue_free()


func _on_area_entered(area: TalkingArea) -> void:
	is_active = true

func _on_area_exited(area: TalkingArea) -> void:
	is_active = false

func SummonPhone():
	var newLocker = PADLOCKER.instantiate()
	newLocker.callList = CallListed
	add_child(newLocker)
