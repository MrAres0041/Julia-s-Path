extends CanvasLayer
class_name padlocker

@export var callList:CallList

@onready var textlabel: RichTextLabel = $Control/RichTextLabel
@onready var L_AudioManager: AudioManager = $Control/AudioManager

var lenght:int

func _ready() -> void:
	Dialogic.signal_event.connect(DialogicHandler)

func _physics_process(delta: float) -> void:
	lenght = textlabel.get_parsed_text().length()
	if lenght == 6:
		if callList.callist.has(textlabel.get_parsed_text()):
			for calli in callList.callist:
				if textlabel.get_parsed_text() == calli:
					var index:int = callList.callist.find(calli)
					callList._callTheNumber(callList.dialogues[index])
		else:
			callList._callTheNumber("default")

		textlabel.text = ""

func _on_button_1_pressed() -> void:
	textlabel.add_text("1")
	_playRandomSound()

func _on_button_2_pressed() -> void:
	textlabel.add_text("2")
	_playRandomSound()

func _on_button_3_pressed() -> void:
	textlabel.add_text("3")
	_playRandomSound()

func _on_button_4_pressed() -> void:
	textlabel.add_text("4")
	_playRandomSound()

func _on_button_5_pressed() -> void:
	textlabel.add_text("5")
	_playRandomSound()

func _on_button_6_pressed() -> void:
	textlabel.add_text("6")
	_playRandomSound()

func _on_button_7_pressed() -> void:
	textlabel.add_text("7")
	_playRandomSound()

func _on_button_8_pressed() -> void:
	textlabel.add_text("8")
	_playRandomSound()

func _on_button_9_pressed() -> void:
	textlabel.add_text("9")
	_playRandomSound()

func _playRandomSound():
	L_AudioManager.pitch_scale = (randf_range(0.8,1.1))
	L_AudioManager.playSFX("Phone",0)

func DialogicHandler(i):
	if i == "DialogueEnded":
		queue_free()
