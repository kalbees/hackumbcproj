class_name Grapple
extends State

var is_moving: bool 
var is_grappled: bool
var target_position: Vector2
var rope: Line2D

func _ready() -> void:
	# connect signal
	SignalBus.connect("player_can_grapple", update_position)

func update(delta: float) -> void:
	if parent.global_position == target_position:
		emit_signal("change_to_state", "fall")

func enter() -> void:
	parent.animated_sprite_2d.sprite_frames.set_animation_loop("grapple_entrance", false)
	parent.animated_sprite_2d.play("grapple_entrance")
	# handle grapple asset creation
	rope = Line2D.new()
	add_child(rope)
	# add texture
	rope.default_color = Color(0.0, 0.0, 0.0, 1.0)
	# add point at parent
	rope.add_point(parent.global_position)
	# add point at target
	rope.add_point(target_position)
	await parent.animated_sprite_2d.animation_finished
	# change player position
	parent.global_position = target_position
	parent.animated_sprite_2d.play("grapple_exit")

func update_position(new_pos: Vector2) -> void:
	new_pos.y += 15.0
	target_position = new_pos

func exit() -> void: 
	parent.animated_sprite_2d.sprite_frames.set_animation_loop("grapple_entrance", true)
	rope.queue_free()
