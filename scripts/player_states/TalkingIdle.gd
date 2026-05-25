extends State

@onready var talking_area: TalkingArea = $"../.."
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"

var dir:Vector2

func _ready() -> void:
	Dialogic.timeline_started.connect(_on_timeline_started)

func _on_talking_area_area_entered(area: DialogueManager) -> void:
	talking_area.dialogue = area
	transitioned.emit(self, "CanTalk")
	
func physics_update(_delta: float) -> void:
	dir = talking_area.Player.dir
	match dir:
		Vector2(0,-1):
			collision_shape_2d.rotation_degrees = 0.0
			collision_shape_2d.position = Vector2(0.0,-68.0)
		Vector2(0,1):
			collision_shape_2d.rotation_degrees = 0
			collision_shape_2d.position = Vector2(0.0,88.0)
		Vector2(-1,0):
			collision_shape_2d.rotation_degrees = 90.0
			collision_shape_2d.position = Vector2(-60.0,20.0)
		Vector2(1,0):
			collision_shape_2d.rotation_degrees = 90.0
			collision_shape_2d.position = Vector2(60.0,20.0)

func _on_timeline_started():
	transitioned.emit(self, "Talking")
