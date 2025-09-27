class_name Move
extends State

var is_moving: bool = true 

# handle movement 
func update(delta: float) -> void: 
	# get direction and set velocity 
	var direction = Input.get_axis("ui_left", "ui_right")
	parent.velocity.x = direction * parent.movement.curr_move_speed
	# change sprite direction
	if direction < 0:
		parent.animated_sprite_2d.flip_h = true
	if direction > 0:
		parent.animated_sprite_2d.flip_h = false
	parent.move_and_slide()
	get_external_input()

# handle non-movement input 
func get_external_input() -> void:
	# handle jumping 
	if Input.is_action_just_pressed("ui_up"):
		emit_signal("change_to_state", "jump")
	# handle idling 
	if not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		is_moving = false
		emit_signal("change_to_state", "idle")
	# handle falling
	if parent.velocity.y > 0:
		emit_signal("change_to_state", "fall")
	# handle grappling 
	if Input.is_action_just_pressed("grapple") and parent.can_grapple:
		emit_signal("change_to_state", "grapple")

func enter() -> void:
	is_moving = true
	parent.animated_sprite_2d.play("move")

func exit() -> void: 
	pass
