extends Node2D
class_name GIndexConfigs

const CONFIG_PATH:String = "res://settings.cfg"

var config:= ConfigFile.new()

func _ready():
	await ready
	await load_or_create_config()
	await set_vol()
	await set_graph()
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")


func load_or_create_config():
	var err = config.load(CONFIG_PATH)
	
	if err != OK:
		set_defaults()
		save_config()
	else:
		print("Config Cargada!")

func set_defaults():
	config.set_value("audio", "master_volume", 1.0)
	config.set_value("audio", "music_volume", 1.0)
	config.set_value("audio", "sfx_volume", 1.0)
	config.set_value("graphics", "fullscreen", false)
	config.set_value("graphics", "width", 1280)
	config.set_value("graphics", "height", 720)

func save_config():
	config.save(CONFIG_PATH)

func get_value(section: String, key: String, default):
	return config.get_value(section, key, default)

func set_value(section: String, key: String, value):
	config.set_value(section, key, value)
	save_config()

#Insert values
func set_vol():
	AudioServer.set_bus_volume_db(0, linear_to_db(config.get_value("audio", "master_volume", 0.0)))
	AudioServer.set_bus_volume_db(1, linear_to_db(config.get_value("audio", "music_volume", 0.0)))
	AudioServer.set_bus_volume_db(2, linear_to_db(config.get_value("audio", "sfx_volume", 0.0)))

func set_graph():
	var toggled_on:bool = get_value("graphics", "fullscreen", false)
	var width = config.get_value("graphics", "width", 1280)
	var height = config.get_value("graphics", "height", 720)
	
	DisplayServer.window_set_size(Vector2i(width,height))
	get_window().move_to_center()
	
	
	if !toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
