extends Control
class_name title_bg

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_manager: AudioManager = $AudioManager

func _ready() -> void:
	animation_player.play("enter")

func _playTree():
	audio_manager.playSFX("Tree",0)
