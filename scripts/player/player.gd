class_name Player
extends CharacterBody2D

# enum for ports
enum Cords {
	ETHERNET,
	VGA,
	USBA
}

# exported components
@export var movement: Movement
@export var hitbox: Hitbox 

# onready variables 
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $StateMachine

# relevant conditionals 
var can_grapple: bool
var is_dead: bool
var curr_port: Cords

# initialize all components of the player 
func _ready() -> void:
	# initialize components
	movement.init()
	hitbox.init() 
	state_machine.init(self)
	
	# connect signals
	hitbox.connect("died", on_death)
	
	# initialize port
	curr_port = Cords.USBA

# handle player interactivity 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("use_cord"):
		if curr_port == Cords.ETHERNET:
			emit_signal("player_connect")
		if curr_port == Cords.VGA:
			emit_signal("player_interact")

func use_cord() -> void:
	pass 

# change cord type
func change_cord(type: Cords) -> void:
	curr_port = type

# handle the death of the player 
func on_death() -> void: 
	emit_signal("player_died")
	queue_free()
