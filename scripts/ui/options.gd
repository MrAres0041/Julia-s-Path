extends VBoxContainer
class_name OptionsMenu


@onready var master: HSlider = $SoundOption/VBoxContainer/Master
@onready var music: HSlider = $SoundOption/VBoxContainer/Music
@onready var sfx: HSlider = $SoundOption/VBoxContainer/SFX

func _ready() -> void:
	master.set_value_no_signal(GAudio.getMasterVol()*3)
	music.set_value_no_signal(GAudio.getMusVol()*3)
	sfx.set_value_no_signal(GAudio.getSFXVol()*3)
	
func _on_1280_pressed() -> void:
	DisplayServer.window_set_size(Vector2(1280, 800))
	get_window().move_to_center()
	IndexConfigs.set_value("graphics", "width", 1280)
	IndexConfigs.set_value("graphics", "height", 800)


func _on_1600_pressed() -> void:
	DisplayServer.window_set_size(Vector2(1600, 900))
	get_window().move_to_center()
	IndexConfigs.set_value("graphics", "width", 1600)
	IndexConfigs.set_value("graphics", "height", 900)


func _on_1980_pressed() -> void:
	DisplayServer.window_set_size(Vector2(1980, 1080))
	get_window().move_to_center()
	IndexConfigs.set_value("graphics", "width", 1980)
	IndexConfigs.set_value("graphics", "height", 1080)

	
func _on_check_box_toggled(toggled_on: bool) -> void:
	if !toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		IndexConfigs.set_value("graphics", "fullscreen", false)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		IndexConfigs.set_value("graphics", "fullscreen", true)


func _on_master_value_changed(value: float) -> void:
	GAudio.setMastVol(value/3)

func _on_music_value_changed(value: float) -> void:
	GAudio.setMusVol(value/3)

func _on_sfx_value_changed(value: float) -> void:
	GAudio.setSFXVol(value/3)
