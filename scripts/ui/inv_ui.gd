extends Control
class_name inv_ui

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var inv:Inventory = preload("res://resources/items/inventory.tres")
@onready var slots: Array = $Inv/GridContainer.get_children()

#var is_open:bool = false

func _ready() -> void:
	visible = false
	_update_slots()
	Dialogic.signal_event.connect(DialogicHandler)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("inv") and !GPlayer.is_talking:
		vis_inv()
	if Input.is_action_just_pressed("back") and GPlayer.inv_open and !GPlayer.is_talking:
		animation_player.play("exit")

func _update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i]._update(inv.items[i])

func vis_inv():
	if visible == false:
		visible = true
		animation_player.play("enter")
	else:
		animation_player.play("exit")

func DialogicHandler(i):
	if i == "ItemAdded":
		_update_slots()
