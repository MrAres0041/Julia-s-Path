extends Node
class_name G_Audio

const CONFIG_PATH:String = "res://settings.cfg"

func setMastVol(newMasterVol:float):
	IndexConfigs.set_value("audio", "master_volume", newMasterVol)
	IndexConfigs.save_config()

func setMusVol(newMusVol:float):
	IndexConfigs.set_value("audio", "music_volume", newMusVol)
	IndexConfigs.save_config()

func setSFXVol(newSFXVol:float):
	IndexConfigs.set_value("audio", "sfx_volume", newSFXVol)
	IndexConfigs.save_config()
