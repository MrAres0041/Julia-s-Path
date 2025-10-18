extends Resource
class_name Inv_Item

@export var name:String = ""
@export var texture:Texture2D
@export var item_txt:String

func _showDescription():
	Dialogic.play(item_txt)
