class_name Idle
extends State

func update(delta: float) -> void: 
	# handle other state changes
	if (Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right")):
		emit_signal("change_to_state", "move")
	if (Input.is_action_just_pressed("ui_up")):
		emit_signal("change_to_state", "jump")
	if not parent.is_on_floor():
		emit_signal("change_to_state", "fall")

func enter() -> void:
	parent.animated_sprite_2d.play("idle")

func exit() -> void: 
	pass
