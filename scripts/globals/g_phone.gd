class_name GPhoneSignal extends Node

const PADLOCKER = preload("res://scenes/UI/padlocker.tscn")

var CallListed = {
	"Act1" = preload("res://resources/calls/Act1.tres")
}

func SummonPhone(index):
	var newLocker = PADLOCKER.instantiate()
	newLocker.callList = CallListed[index]
	add_child(newLocker)
