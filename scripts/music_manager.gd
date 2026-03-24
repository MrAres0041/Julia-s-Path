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
		preload("res://assets/audio/music/Spellbound (Music Box).mp3"),
		preload("res://assets/audio/music/Dusty Memories MP3.mp3")
	],
	
}

var currentPlayList: String = ""
var currentIndex: int = 0


func _ready() -> void:
	currentIndex = StartingIndex
	
	playPlaylist(StartingPlaylist)
	

func playPlaylist(nombre:String):
	if !playlist.has(nombre):
		push_warning("Music not found: %s" % nombre)
		return
	
	currentPlayList = nombre
	_play_current_track()
	
func _play_current_track():
	var list = playlist[currentPlayList]
	stream = list[currentIndex]
	play()


func _on_finished() -> void:
	play()
