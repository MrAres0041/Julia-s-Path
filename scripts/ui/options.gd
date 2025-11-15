extends VBoxContainer
class_name OptionsMenu


@onready var master: HSlider = $SoundOption/VBoxContainer/Master
@onready var music: HSlider = $SoundOption/VBoxContainer/Music
@onready var sfx: HSlider = $SoundOption/VBoxContainer/SFX
@onready var check_box: CheckButton = $Screen/HBoxContainer/CheckBox

func _ready() -> void:
	master.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(0)))
	music.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(1)))
	sfx.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(2)))
	
func _on_1280_pressed() -> void:
	DisplayServer.window_set_size(Vector2(1280, 800))
	get_window().move_to_center()
	#get_viewport().size = Vector2(1600,900)


func _on_1600_pressed() -> void:
	#get_viewport().size = Vector2(1600,900)
	DisplayServer.window_set_size(Vector2(1600,900))
	get_window().move_to_center()


func _on_1980_pressed() -> void:
	#get_viewport().size = Vector2(1980,1080)
	DisplayServer.window_set_size(Vector2(1980,1080))
	get_window().move_to_center()

	
func _on_check_box_toggled(toggled_on: bool) -> void:
	if !toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


#Subida de audio repentina, fixear despues
func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))


func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,linear_to_db(value))


func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,linear_to_db(value))
