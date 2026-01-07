extends Node2D
class_name MainEvents

var pills_1_check:bool = false
var pills_2_check:bool = false

@onready var corridorExit: CamDetector = $"../Cam_Movement/J_Corridor/Cam_Detector2"
@onready var car_pills: DialogueManager = $"../Cam_Movement/J_Garage/Interactions/Car_pills"

@onready var pill_1_false: DinamicDManager = $Pill1_False

func _ready() -> void:
	corridorExit.monitoring = false
	Dialogic.signal_event.connect(_ProgressHandler)

func _ProgressHandler(i):
	match i:
		"Pills1":
			_activateMonitor(corridorExit)
			_killNode(pill_1_false)
		"Pills2":
			pass


func _activateMonitor(trigger:Area2D):
	trigger.monitoring = true

func _killNode(node):
	get_tree().queue_delete(node)
