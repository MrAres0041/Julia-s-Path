class_name TalkManager extends Area2D


func _ready() -> void:
	Dialogic.signal_event.connect(DialogicHandler)
	
func DialogicHandler(i):
	if i == "DialogueEnded":
		GPlayer.is_talking = false

func Look_At_This(dir:Vector2):
	match dir:
		Vector2(1,0):
			rotation_degrees = -90.0
		Vector2(-1,0):
			rotation_degrees = 90.0
		Vector2(0,-1):
			rotation_degrees = 180.0
		Vector2(0,1):
			rotation_degrees = 0
