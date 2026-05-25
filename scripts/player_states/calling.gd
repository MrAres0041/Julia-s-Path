extends State

@onready var talking_area: TalkingArea = $"../.."

func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func enter() -> void:
	talking_area.Player._LockMovement()

func exit() -> void:
	talking_area.Player._UnlockMovement()

func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		await get_tree().create_timer(0.1).timeout
		transitioned.emit(self, "Idle")
	
func _on_timeline_ended():
	transitioned.emit(self, "Idle")
