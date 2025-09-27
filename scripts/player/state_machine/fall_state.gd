class_name Fall
extends State

func update(delta: float) -> void: 
	# move player downward
	parent.velocity.y += parent.movement.curr_gravity * delta
	# handle other movement 
	get_external_input()
	parent.move_and_slide()
	# handle idle 
	if parent.is_on_floor():
		emit_signal("change_to_state", "idle")

func get_external_input() -> void: 
	# handle left and right movement 
	# get direction and set velocity 
	var direction = Input.get_axis("ui_left", "ui_right")
	parent.velocity.x = direction * parent.movement.curr_move_speed
	# change sprite direction
	if direction < 0:
		parent.animated_sprite_2d.flip_h = true
	if direction > 0:
		parent.animated_sprite_2d.flip_h = false
	# handle transition to grapple
	if Input.is_action_just_pressed("grapple") and parent.can_grapple:
		emit_signal("change_to_state", "grapple")

func enter() -> void:
	parent.animated_sprite_2d.play("fall")

func exit() -> void: 
	pass
