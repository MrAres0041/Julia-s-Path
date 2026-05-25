extends State

@onready var talking_area: TalkingArea = $"../.."

func enter() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	talking_area.Player._LockMovement()

func _on_timeline_ended():
	talking_area.Player._UnlockMovement()
	transitioned.emit(self, "Idle")
