extends AudioStreamPlayer
class_name MusicManager

@export_enum("menu", "JuliaHouse0") var StartingPlaylist:String
@export var StartingIndex:int = 0

var playlist = {
	"menu": [
		preload("res://assets/audio/music/The Witch's Woods.mp3"),
		preload("res://assets/audio/music/Enter the Clown.mp3")
	],
	"JuliaHouse0": [
		preload("res://assets/audio/music/Scattle - It's Safe Now.mp3")
	]
}

var currentPlayList: String = ""
var currentIndex: int = 0


func _ready() -> void:
	AudioServer.set_bus_volume_db(1, GAudio.musicVol)
	currentIndex = StartingIndex
	playPlaylist(StartingPlaylist)

func playPlaylist(nombre:String):
	if !playlist.has(nombre):
		push_warning("Music not found: %s" % nombre)
		return
	
	currentPlayList = nombre
	currentIndex = 0
	_play_current_track()
	
func _play_current_track():
	var list = playlist[currentPlayList]
	stream = list[currentIndex]
	play()


func _on_finished() -> void:
	var list = playlist[currentPlayList]
	
	currentIndex += 1
	if currentIndex >= list.size():
		currentIndex = 0
