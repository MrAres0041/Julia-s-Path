extends Node2D
class_name AudioManager

@export var StartMusic:String

func _ready() -> void:

	$MusicPlayer.play()
	$MusicPlayer.bus = "music"
	AudioServer.set_bus_volume_db(1, GAudio.musicVol)
	$SFXPlayer.bus = "sfx"
	AudioServer.set_bus_volume_db(2, GAudio.sfxVol)


func _playMusic(newMusic:String):
	$MusicPlayer.play(newMusic)

func _playSFX(newSFX:String):
	$SFXPlayer.play(newSFX)
