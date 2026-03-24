extends AudioStreamPlayer
class_name AudioManager

@export_enum("Door", "Item_Collect", "Phone", "Tree", "Steps") var SelectedSFX:String
@export var ChosenIndex:int = 0

var playlist = {
	"Door": [
		preload("res://assets/audio/sfx/door.ogg")
	],
	"Item_Collect": [
		preload("res://assets/audio/sfx/item_collect.ogg")
	],
	"Phone":[
		preload("res://assets/audio/sfx/phone_button.mp3"),
		preload("res://assets/audio/sfx/phone.ogg")
	],
	"Tree":[
		preload("res://assets/audio/sfx/tree.ogg")
	],
	"Steps":[
		preload("res://assets/audio/sfx/steps.ogg")
	]
}

func playSFX(nombre:String, index:int):
	if !playlist.has(nombre):
		push_warning("SFX not found: %s" % nombre)
		return
	SelectedSFX = nombre
	ChosenIndex = index
	_play_current_track()
	
func _play_current_track():
	var list = playlist[SelectedSFX]
	stream = list[ChosenIndex]
	play()
