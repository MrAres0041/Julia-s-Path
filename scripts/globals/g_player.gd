extends Node
class_name g_player


var is_talking:bool = false
var inv_open:bool = false
var can_talk:bool = false
var can_walk:bool = false
var pause:bool = false

func G_SetDefaults():
	is_talking = false
	inv_open = false
	can_talk = false
	can_walk = false
	pause = false
