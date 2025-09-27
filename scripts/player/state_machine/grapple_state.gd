class_name Grapple
extends State

var is_moving: bool 
var is_grappled: bool
var target_position: Vector2
var rope: Line2D

func update(delta: float) -> void: 
	parent.global_position += parent.global_position.move_toward(target_position,
	parent.movement.curr_grapple_speed * delta)
	if parent.global_position == target_position:
		exit()

func enter() -> void:
	parent.animated_sprite_2d.play("grapple")
	# handle grapple asset creation
	rope = Line2D.new()
	add_child(rope)
	# add texture
	
	# add point at parent
	rope.add_point(parent.global_position)
	# add point at target
	rope.add_point(target_position)

func exit() -> void: 
	rope.queue_free()
	emit_signal("change_to_state", "fall")
