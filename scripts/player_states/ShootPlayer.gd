extends State

@onready var player: CharacterBody2D = $"../.." # Ajusta la ruta para llegar a tu Personaje

func enter() -> void:
	# Aquí puedes reproducir la animación de Idle
	# %AnimationPlayer.play("idle")
	pass

func physics_update(_delta: float) -> void:
	# Si el jugador se mueve en el eje X, cambiamos al estado "Run"
	var input_dir = Input.get_vector("left","right","up","down")
	
	if input_dir != Vector2.ZERO:
		transitioned.emit(self, "Run")
