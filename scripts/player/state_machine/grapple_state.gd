class_name Grapple
extends State

var is_moving: bool 
var is_grappled: bool
var target_position: Vector2
var rope: Line2D

func update(delta: float) -> void: 
	var direction: Vector2 = (target_position - parent.global_position).normalized()
	parent.velocity = direction * parent.movement.curr_grapple_speed
	parent.move_and_slide()
	if parent.global_position.distance_to(target_position) < 2.0:
		exit()

func enter() -> void:
	# connect signal
	SignalBus.connect("player_can_grapple", update_position)
	parent.animated_sprite_2d.play("grapple")
	# handle grapple asset creation
	rope = Line2D.new()
	add_child(rope)
	# add texture
	
	# add point at parent
	rope.add_point(parent.global_position)
	# add point at target
	rope.add_point(target_position)

func update_position(new_pos: Vector2) -> void:
	target_position = new_pos

func exit() -> void: 
	rope.queue_free()
	emit_signal("change_to_state", "fall")
