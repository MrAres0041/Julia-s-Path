extends AudioStreamPlayer
class_name MusicManager

@export_enum("menu", "Spellbound", "Dusty Memories") var StartingPlaylist:String
@export var StartingIndex:int = 0

var playlist = {
	"menu": [
		preload("res://assets/audio/music/The Witch's Woods.mp3"),
		preload("res://assets/audio/music/Enter the Clown.mp3")
	],
	"Spellbound": [
		preload("res://assets/audio/music/Spellbound (Music Box).mp3"),
	],
	"Dusty Memories": [
		preload("res://assets/audio/music/Dusty Memories MP3.mp3")
	]
	
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

func stop_with_fade(duration: float = 1.5) -> void:
	var tween = create_tween()
	var start_vol = GAudio.getMusVol()
	
	tween.tween_method(GAudio.setMusVol, start_vol, 0.0, duration)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN)
	
	tween.finished.connect(func():
		stop()
		GAudio.setMusVol(start_vol) 
	)
