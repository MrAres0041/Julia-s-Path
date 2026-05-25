extends State

@onready var talking_area: TalkingArea = $"../.."
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"
@onready var sprite_2d: Sprite2D = $"../../Sprite2D"

var dir:Vector2

func enter() -> void:
	sprite_2d.visible = true

# Equivalente a _exit_tree() o limpieza, se ejecuta al salir del estado
func exit() -> void:
	sprite_2d.visible = false

# Equivalente a _physics_process()
func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("dialogic_default_action") and !talking_area.timeline == "":
		print(talking_area.timeline)
		Dialogic.start(talking_area.timeline)
		transitioned.emit(self, "Talking")

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


func _on_talking_area_area_exited(area: DialogueManager) -> void:
	print("Idle")
	transitioned.emit(self, "Idle")
