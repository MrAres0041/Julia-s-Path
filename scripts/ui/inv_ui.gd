extends Control
class_name inv_ui

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var inv:Inventory = preload("res://resources/items/inventory.tres")
@onready var slots: Array = $Inv/GridContainer.get_children()

func _ready() -> void:
	_update_slots()
	Dialogic.signal_event.connect(DialogicHandler)
	animation_player.play("enter")

func _update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i]._update(inv.items[i])

func DialogicHandler(i):
	if i == "ItemAdded":
		_update_slots()
