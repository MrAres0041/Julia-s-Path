class_name State
extends Node

# Señal para avisarle a la StateMachine que queremos cambiar de estado
signal transitioned(state: State, new_state_name: String)

# Equivalente a _ready(), se ejecuta al entrar al estado
func enter() -> void:
	pass

# Equivalente a _exit_tree() o limpieza, se ejecuta al salir del estado
func exit() -> void:
	pass

# Equivalente a _process()
func update(_delta: float) -> void:
	pass

# Equivalente a _physics_process()
func physics_update(_delta: float) -> void:
	pass
