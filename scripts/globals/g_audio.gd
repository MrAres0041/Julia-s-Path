extends Node
class_name G_Audio

const CONFIG_PATH:String = "res://settings.cfg"

func setMastVol(newMasterVol:float):
	IndexConfigs.set_value("audio", "master_volume", newMasterVol)
	AudioServer.set_bus_volume_db(0,linear_to_db(newMasterVol))
	IndexConfigs.save_config()

func setMusVol(newMusVol:float):
	IndexConfigs.set_value("audio", "music_volume", newMusVol)
	AudioServer.set_bus_volume_db(1,linear_to_db(newMusVol))
	IndexConfigs.save_config()

func setSFXVol(newSFXVol:float):
	IndexConfigs.set_value("audio", "sfx_volume", newSFXVol)
	AudioServer.set_bus_volume_db(2,linear_to_db(newSFXVol))
	IndexConfigs.save_config()

func getMasterVol():
	return IndexConfigs.get_value("audio", "master_volume", 0.0)

func getMusVol():
	return IndexConfigs.get_value("audio", "music_volume", 0.0)

func getSFXVol():
	return IndexConfigs.get_value("audio", "sfx_volume", 0.0)
