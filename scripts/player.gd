class_name Player extends CharacterBody2D

@export var speed:int = 300

@onready var state_machine: StateMachine = $StateMachine
var can_change:bool = true

var dir:Vector2 = Vector2.ZERO

func _UnlockMovement():
	state_machine.change_state("Idle")

func _LockMovement():
	state_machine.change_state("Locked")
