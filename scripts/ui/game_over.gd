extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		get_tree().change_scene_to_file("res://scenes/levels/game.tscn")
