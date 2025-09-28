class_name Movement
extends Resource

# default speeds
const GRAVITY: float = 1000.0
const JUMP_FORCE: float = 500.0 
const MOVE_SPEED: float = 400.0
const GRAPPLE_SPEED: float = 500.0

# speed related variables 
var curr_gravity: float 
var curr_jump_force: float 
var curr_move_speed: float
var curr_grapple_speed: float 

# initialize to default values 
func init() -> void: 
	curr_gravity = GRAVITY
	curr_jump_force = JUMP_FORCE
	curr_move_speed = MOVE_SPEED
	curr_grapple_speed = GRAPPLE_SPEED

# setters
func set_gravity(gravity: float) -> void:
	curr_gravity = gravity

func set_jump_force(jump_force: float) -> void:
	curr_jump_force = jump_force

func set_move_speed(speed: float) -> void:
	curr_move_speed = speed 

func set_grapple_speed(speed: float) -> void:
	curr_grapple_speed = speed 
