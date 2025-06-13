class_name MainMenu extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file.call_deferred("res://scenes/maps/eric_cabin.tscn")
