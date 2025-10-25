extends Resource
class_name Inventory

@export var items:Array[Inv_Item]

func _insert(item:Inv_Item):
	for i in range(items.size()):
		if items[i]==null:
			items[i]=item
			return
