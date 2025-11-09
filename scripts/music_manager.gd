extends AudioStreamPlayer
class_name MusicManager

@export var StartMusic:String

func _ready() -> void:
	AudioServer.set_bus_volume_db(1, GAudio.musicVol)

func _playMusic(newMusic:String):
	$MusicPlayer.play(newMusic)


func _stopMusic():
	$MusicPlayer.stop()
