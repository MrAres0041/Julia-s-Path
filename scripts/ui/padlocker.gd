extends Control
class_name padlocker

@onready var textlabel: RichTextLabel = $VBoxContainer/RichTextLabel
var lenght:int

func _physics_process(delta: float) -> void:
	lenght = textlabel.get_parsed_text().length()
	if lenght == 4:
		if textlabel.get_parsed_text() == "1212":
			print("Correct code!")
		else:
			print("Wrong code...")
		textlabel.text = ""

func _on_button_1_pressed() -> void:
	textlabel.add_text("1")


func _on_button_2_pressed() -> void:
	textlabel.add_text("2")


func _on_button_3_pressed() -> void:
	textlabel.add_text("3")


func _on_button_4_pressed() -> void:
	textlabel.add_text("4")


func _on_button_5_pressed() -> void:
	textlabel.add_text("5")


func _on_button_6_pressed() -> void:
	textlabel.add_text("6")


func _on_button_7_pressed() -> void:
	textlabel.add_text("7")


func _on_button_8_pressed() -> void:
	textlabel.add_text("8")


func _on_button_9_pressed() -> void:
	textlabel.add_text("9")
