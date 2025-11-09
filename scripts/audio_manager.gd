extends Node2D
class_name AudioManager

@export var StartMusic:String

func _ready() -> void:

	$MusicPlayer.play()
	AudioServer.set_bus_volume_db(1, GAudio.musicVol)
	AudioServer.set_bus_volume_db(2, GAudio.sfxVol)


func _playMusic(newMusic:String):
	$MusicPlayer.play(newMusic)

func _playSFX(newSFX:String):
	$SFXPlayer.play(newSFX)
