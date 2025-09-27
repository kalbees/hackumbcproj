class_name StateMachine
extends Node2D

# states info 
@export var states: Dictionary = {}
@export var curr_state: State
@export var initial_state: State 

# call every frame'
func _physics_process(delta: float) -> void:
	curr_state.update(delta)

# initialize states
func init(parent: Player) -> void: 
	# add states to dictionary
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child 
			child.parent = parent
			child.connect("change_to_state", change_state)
	if initial_state:
		initial_state.enter()

# change state 
func change_state(state: String) -> void: 
	print("changed state:" + state)
	if curr_state:
		curr_state.exit()
	curr_state = states[state]
	curr_state.enter()
