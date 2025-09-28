extends Control

@onready var text_edit: TextEdit = $TextEdit

func _on_text_edit_text_changed() -> void:
	if text_edit.text == "4321":
		SignalBus.emit_signal("puzzle_solved")
