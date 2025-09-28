class_name Player
extends CharacterBody2D

# exported components
@export var movement: Movement
@export var hitbox: Hitbox 

# onready variables 
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $StateMachine

# relevant conditionals 
var can_grapple: bool
var is_dead: bool
var curr_port: PlayerDataManager.Cords

# initialize all components of the player 
func _ready() -> void:
	# initialize components
	movement.init()
	hitbox.init() 
	state_machine.init(self)
	
	# connect signals
	SignalBus.connect("player_can_grapple", toggle_grapple_on)
	SignalBus.connect("player_cannot_grapple", toggle_grapple_off)
	SignalBus.connect("player_save_to_manager", save_to_manager)
	SignalBus.connect("player_load_from_manager", load_from_manager)
	SignalBus.connect("player_won", on_player_win)
	hitbox.connect("died", on_death)
	
	# initialize port
	curr_port = PlayerDataManager.Cords.USBA

# handle player interactivity 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("use_cord"):
		if curr_port == PlayerDataManager.Cords.ETHERNET:
			can_grapple = false 
			SignalBus.emit_signal("player_connect")
		if curr_port == PlayerDataManager.Cords.VGA:
			can_grapple = false
			SignalBus.emit_signal("player_interact")
		if curr_port == PlayerDataManager.Cords.USBA:
			can_grapple = true
	if event.is_action_pressed("change_port"):
		curr_port = (curr_port + 1) % PlayerDataManager.Cords.COUNT
		SignalBus.emit_signal("player_change_port", curr_port)

# change cord type
func change_cord(type: PlayerDataManager.Cords) -> void:
	curr_port = type
	SignalBus.emit_signal("player_change_port", curr_port)

# handle grapple perms on
func toggle_grapple_on(pos: Vector2) -> void:
	can_grapple = true 

# handle grapple perms off
func toggle_grapple_off() -> void: 
	can_grapple = false

# handle saving info between scenes
func save_to_manager() -> void: 
	PlayerDataManager.player_cord = curr_port
	PlayerDataManager.player_health = hitbox.curr_health

# handle loading info between states
func load_from_manager() -> void: 
	curr_port = PlayerDataManager.player_cord
	hitbox.curr_health = PlayerDataManager.player_health

# handle the death of the player 
func on_death() -> void: 
	SignalBus.emit_signal("player_died")
	get_tree().call_deferred("change_scene_to_file", "res://scenes/ui/game_over.tscn")
	call_deferred("queue_free")

# handle win condition
func on_player_win() -> void:
	call_deferred("queue_free")
