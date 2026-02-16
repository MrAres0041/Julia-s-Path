extends Path2D
class_name PathGuiderManager

@export var speed:float
@export var path_follow: PathFollow2D

var walk:bool = false

func _physics_process(delta: float) -> void:
	if !walk:
		path_follow.progress_ratio = 0
	else:
		path_follow.progress_ratio += speed * 1

func _startWalking():
		walk = true

func _stopWalking():
		walk = false
