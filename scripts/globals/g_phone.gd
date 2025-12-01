class_name GPhoneSignal extends Node

const PADLOCKER = preload("res://scenes/UI/padlocker.tscn")

var CallList = {
	"Act1" = preload("res://resources/calls/Act1.tres")
}

func SummonPhone(index):
	var newLocker = PADLOCKER.instantiate()
	newLocker.callList = CallList[index]
	add_child(newLocker)
