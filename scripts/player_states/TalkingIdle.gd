extends State

@onready var talking_area: TalkingArea = $"../.."
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"

var dir:Vector2


func enter() -> void:
	talking_area.timeline = ""
	talking_area.item = null

func _on_talking_area_area_entered(area: DialogueManager) -> void:
	print("Can Talk!")
	talking_area.timeline = area.timeline
	talking_area.item = area.item
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
			collision_shape_2d.position = Vector2(-60.0,40.0)
		Vector2(1,0):
			collision_shape_2d.rotation_degrees = 90.0
			collision_shape_2d.position = Vector2(60.0,40.0)
