class_name Jump
extends State

func update(delta: float) -> void:
	# handle vertical velocity 
	parent.velocity.y += parent.movement.curr_gravity * delta
	get_external_input()
	parent.move_and_slide()

func get_external_input() -> void:
	# consider horizontal movement 
	var direction = Input.get_axis("ui_left", "ui_right")
	parent.velocity.x = direction * parent.movement.curr_move_speed
	if direction < 0:
		parent.animated_sprite_2d.flip_h = true
	if direction > 0:
		parent.animated_sprite_2d.flip_h = false
	# handle falling 
	if parent.velocity.y > 0: 
		emit_signal("change_to_state", "fall")
	# handle transition to idle
	if parent.is_on_floor():
		emit_signal("change_to_state", "idle")
	# handle transition to grapple
	if Input.is_action_just_pressed("grapple") and parent.can_grapple:
		emit_signal("change_to_state", "grapple")

func enter() -> void:
	parent.animated_sprite_2d.play("jump")
	parent.velocity.y = -parent.movement.curr_jump_force
