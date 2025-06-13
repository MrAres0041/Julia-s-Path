class_name SceneChanger extends Area2D

#@export var SCENE: PackedScene
@export_file(".tscn") var SCENE: String

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		#get_tree().change_scene_to_packed.call_deferred(SCENE)
		get_parent()._fadeOut()
		$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file.call_deferred(SCENE)
	
