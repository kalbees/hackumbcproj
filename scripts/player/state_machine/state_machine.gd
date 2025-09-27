class_name StateMachine
extends Node2D

# states info 
@export var states: Dictionary = {}
@export var curr_state: State
@export var initial_state: State 

# initialize states
func init(parent: Player) -> void: 
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child 
			child.parent = parent
	if initial_state:
		initial_state.enter()
