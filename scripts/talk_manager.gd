class_name TalkManager extends Area2D

var talk_area: Area2D

func _ready() -> void:
	Dialogic.signal_event.connect(DialogicHandler)
	$Sprite2D.visible = false
	$AnimationPlayer.play("interaction")
	
func _physics_process(delta: float) -> void:
		if Input.is_action_just_pressed("dialogic_default_action") and GPlayer.can_talk and !GPlayer.inv_open and !GPlayer.is_talking and talk_area:
			#talk_area.Execute_Dialogue()
			GPlayer.is_talking = true
			$Sprite2D.visible = false
			talk_area.Execute_Dialogue()
	
func DialogicHandler(i):
	if i == "DialogueEnded":
		GPlayer.is_talking = false

func Look_At_This(dir:Vector2):
	match dir:
		Vector2(0,-1):
			$CollisionShape2D.rotation_degrees = 0.0
			$CollisionShape2D.position = Vector2(0.0,-68.0)
		Vector2(0,1):
			$CollisionShape2D.rotation_degrees = 0
			$CollisionShape2D.position = Vector2(0.0,88.0)
		Vector2(-1,0):
			$CollisionShape2D.rotation_degrees = 90.0
			$CollisionShape2D.position = Vector2(-60.0,40.0)
		Vector2(1,0):
			$CollisionShape2D.rotation_degrees = 90.0
			$CollisionShape2D.position = Vector2(60.0,40.0)


func _on_area_entered(area: Area2D) -> void:
	talk_area = area
	GPlayer.can_talk = true
	$Sprite2D.visible = true

func _on_area_exited(area: Area2D) -> void:
	talk_area = null
	GPlayer.can_talk = false
	$Sprite2D.visible = false
