extends Panel
class_name inv_ui_slot

@onready var item_display: Sprite2D = $CenterContainer/Panel/Item_display

var selected: bool = false
var item_desc:String

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("read") and selected and item_desc != "":
		print(item_desc)
		Dialogic.start(item_desc)
		selected = false
		GPlayer.is_talking = true

func _update(item:Inv_Item):
	if !item:
		item_display.visible = false
	else:
		item_display.visible = true
		item_display.texture = item.texture
		item_desc = item.item_txt

func _on_area_2d_mouse_entered() -> void:
	$Sprite2D.self_modulate = Color(1,1,1,1)
	selected = true


func _on_area_2d_mouse_exited() -> void:
	$Sprite2D.self_modulate = Color(0.6,0.6,0.6,1)
	selected = false
