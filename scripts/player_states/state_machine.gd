class_name StateMachine extends Node

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

func _ready() -> void:
	# Buscamos todos los hijos que sean del tipo "State" y los guardamos
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

# Esta función maneja el cambio de un estado a otro
func on_child_transition(state: State, new_state_name: String) -> void:
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state

func change_state(new_state_name: String) -> void:
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("Error: El estado ", new_state_name, " no existe en esta máquina.")
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state
