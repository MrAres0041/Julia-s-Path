extends Node2D
class_name MainEvents


@onready var corridorExit: CamDetector = $"../Cam_Movement/J_Corridor/Cam_Detector2"
@onready var car_pills: DialogueManager = $"../Cam_Movement/J_Garage/Interactions/Car_pills"
@onready var mom_standing: Sprite2D = $"../Cam_Movement/J_Living/Props/Mom_Standing"
@onready var mom_hitbox: CollisionShape2D = $"../Cam_Movement/J_Living/Props/MomHitbox"
@onready var mom_sleeping: DialogueManager = $"../Cam_Movement/J_Living/Interactions/MomSleeping"

@onready var mom_awake: DinamicDManager = $Mom_awake
@onready var no_pills: DinamicDManager = $No_pills

func _ready() -> void:
	_deactivateMonitor(corridorExit)
	_deactivateMonitor(mom_awake)
	Dialogic.signal_event.connect(_ProgressHandler)

func _ProgressHandler(i):
	match i:
		"NoPills1":
			_activateMonitor(corridorExit)
			_killNode(no_pills)
		"Pills2":
			mom_standing.visible = true
			mom_hitbox.disabled = false
			_activateMonitor(mom_awake)
			_killNode(mom_sleeping)

func _activateMonitor(trigger:Area2D):
	trigger.monitoring = true

func _deactivateMonitor(trigger:Area2D):
	trigger.monitoring = false

func _killNode(node):
	if is_instance_valid(node):
		remove_child(node)
		node.queue_free()
