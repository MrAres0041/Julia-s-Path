extends Node2D
class_name MainEvents


@onready var corridorExit: CamDetector = $"../Cam_Movement/J_Corridor/Cam_Detector2"
@onready var car_pills: DialogueManager = $"../Cam_Movement/J_Garage/Interactions/Car_pills"
@onready var mom_sleeping: DialogueManager = $"../Cam_Movement/J_Living/Interactions/MomSleeping"
@onready var door_living: Sprite2D = $"../Cam_Movement/J_Living/Props/Door"
@onready var door: Sprite2D = $"../Cam_Movement/J_Living/Props/Door"

@onready var mom_awake: DinamicDManager = $Interactions/Mom_awake
@onready var no_pills: DinamicDManager = $Interactions/No_pills
@onready var door_call: DinamicDManager = $Interactions/Door_call

@onready var path_follow_gloria: PathFollow2D = $"../Cam_Movement/J_Living/NPCs/GloriaDoor/PathFollow2D"

@onready var gloria_door: PathGuiderManager = $"../Cam_Movement/J_Living/NPCs/GloriaDoor"
@onready var gloria: NPC_Sample = $"../Cam_Movement/J_Living/NPCs/GloriaDoor/PathFollow2D/Gloria"

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

func _ready() -> void:
	_deactivateMonitor(corridorExit)
	_deactivateMonitor(mom_awake)
	_deactivateMonitor(door_call)
	Dialogic.signal_event.connect(_ProgressHandler)

func _ProgressHandler(i):
	match i:
		"NoPills1":
			_activateMonitor(corridorExit)
			_killNode(no_pills)
		"Pills2":
			_activateMonitor(mom_awake)
			_activateMonitor(door_call)
			_killNode(mom_sleeping)
			gloria.setActive(true)
		"Door_calling":
			gloria_door._startWalking()
		"OpenDoor":
			door.visible = false
		"DoorClose":
			animation_player.play("fade_out")
		"LightAgain":
			door.visible = true
			animation_player.play("fade_in")

func _activateMonitor(trigger:Area2D):
	trigger.monitoring = true

func _deactivateMonitor(trigger:Area2D):
	trigger.monitoring = false

func _killNode(node):
	if is_instance_valid(node):
		remove_child(node)
		node.queue_free()
