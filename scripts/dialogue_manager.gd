class_name DialogueManager extends Area2D

@export var timeline:String

func Execute_Dialogue():
	Dialogic.start(timeline)
