class_name CameraManager extends Camera2D


func _ready() -> void:
	$AnimationPlayer.play("fade_in")

func _fadeOut():
	$AnimationPlayer.play("fade_out")
	
