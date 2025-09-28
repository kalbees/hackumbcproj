extends Area2D

@export var new_scene: String 

func switch_scene() -> void: 
	SignalBus.emit_signal("player_save_to_manager")
	get_tree().change_scene_to_file(new_scene)
