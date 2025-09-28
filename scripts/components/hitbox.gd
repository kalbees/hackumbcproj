class_name Hitbox
extends Area2D

# signals
signal died

# default constants
const HEALTH: int = 3

# variables
var curr_health: int
var max_health: int

# initialize default health 
func init() -> void:
	curr_health = HEALTH
	max_health = curr_health

# curr health setter 
func set_health(health: int) -> void:
	curr_health = health
	clamp(curr_health, 0, HEALTH)

# max health setter
func set_max_health(health: int) -> void: 
	max_health = health 

# take dmg func
func take_dmg(dmg: int) -> void: 
	curr_health =- dmg
	if (curr_health <= 0):
		die() 

# on death func 
func die() -> void: 
	emit_signal("died")
