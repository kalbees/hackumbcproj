extends Area2D

var puzzle_solved: bool = false 

func _ready() -> void:
	SignalBus.connect("puzzle_solved", show_light)
	$ColorRect.hide()

func show_light() -> void:
	$ColorRect.show()
	puzzle_solved = true

func _on_body_entered(body: Node2D) -> void:
	if puzzle_solved == true:
		SignalBus.emit_signal("player_won")
		get_tree().call_deferred("change_scene_to_file", "res://scenes/ui/you_win.tscn")
