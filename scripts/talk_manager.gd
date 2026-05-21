class_name TalkManager extends Area2D

var talk_area: Area2D

func _ready() -> void:
	#Dialogic.signal_event.connect(DialogicHandler)
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	$Sprite2D.visible = false
	$AnimationPlayer.play("interaction")
	
func _physics_process(delta: float) -> void:
		#if Input.is_action_just_pressed("dialogic_default_action") and GPlayer.can_talk and !GPlayer.inv_open and !GPlayer.is_talking and talk_area:
		if Input.is_action_just_pressed("dialogic_default_action") and GPlayer.can_talk and !GPlayer.inv_open and !GPlayer.is_talking and talk_area and Dialogic.current_timeline == null:
			GPlayer.is_talking = true
			$Sprite2D.visible = false
			talk_area.Execute_Dialogue()
	
func DialogicHandler(i):
	if i == "DialogueEnded":
		talk_area = null
		GPlayer.is_talking = false
		
func _on_timeline_started():
	GPlayer.is_talking = true
	$Sprite2D.visible = false

func _on_timeline_ended():
	# Esta señal nativa de Dialogic se emite AUTOMÁTICAMENTE al terminar cualquier timeline
	# Usamos call_deferred para retrasar el cambio de estado un frame, evitando que el mismo input
	# que cerró el diálogo vuelva a abrirlo inmediatamente en este frame.
	call_deferred("_finalizar_dialogo")

func _finalizar_dialogo():
	talk_area = null
	GPlayer.is_talking = false
	# Si el jugador sigue dentro del área al terminar, volvemos a mostrar el indicador visual de que puede hablar
	if has_overlapping_areas():
		GPlayer.can_talk = true
		$Sprite2D.visible = true

func Look_At_This(dir:Vector2):
	if !GPlayer.is_talking:
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
	if !GPlayer.is_talking:
		talk_area = area
		GPlayer.can_talk = true
	$Sprite2D.visible = true

func _on_area_exited(area: Area2D) -> void:
	if !GPlayer.is_talking:
		talk_area = null
		GPlayer.can_talk = false
	$Sprite2D.visible = false
