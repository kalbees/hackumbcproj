extends StaticBody2D

const DOWNWARD_POS: float = 250.0
const SPEED: float = 100.0

var first_pos: Vector2
var next_pos: Vector2

var direction: int = 1 # for downward motion 
var target: Vector2

# on ready
func _ready() -> void:
	first_pos = global_position
	next_pos = first_pos
	next_pos.y -= DOWNWARD_POS
	target = next_pos

# go between two positions 
func _physics_process(delta: float) -> void:
	var movement = SPEED * delta
	global_position.move_toward(target, movement)
	if global_position == target:
		if direction == 1:
			target = first_pos
			direction = -1
		else:
			target = next_pos
			direction = 1
