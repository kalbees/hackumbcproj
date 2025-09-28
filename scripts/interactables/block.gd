class_name Block
extends CharacterBody2D

const ZERO: float = 0
const GRAVITY: float = 100.0

@export var movement: Movement 
@onready var hurtbox: Hurtbox = $Hurtbox

func _ready() -> void:
	# set initial gravity to 0
	movement.set_gravity(ZERO)
	# change hurtbox settings
	hurtbox.instant_kill = true

func set_gravity() -> void: 
	movement.set_gravity(GRAVITY)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += movement.curr_gravity * delta
	move_and_slide()
