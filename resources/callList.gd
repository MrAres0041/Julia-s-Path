extends Resource
class_name CallList

@export var callist:Array[String]
@export var dialogues:Array[String]

func _callTheNumber(calli:String):
	Dialogic.start(calli)
