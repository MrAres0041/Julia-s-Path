extends Node
class_name G_Audio

#Default Values
var currentMusic:String
var masterVol:float = 0.0
var musicVol:float = -20.0
var sfxVol:float = -20.0

func setGlobalVol(newMusVol:float, newSFXVol:float, newMasterVol:float):
	masterVol = newMasterVol
	musicVol = newMusVol
	sfxVol = newSFXVol

func setGlobalMus(newMusic:String):
	currentMusic = newMusic
