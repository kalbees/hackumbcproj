extends Node2D

const JUMP_FORCE: float = 400.0
const NEXT_INDEX: int = 1

@onready var player: Player = $Player
@onready var blocks: Node2D = $Blocks
@onready var timer: Timer = $Timer

var all_blocks: Array = []
var curr_block: int = 0

# configure new settings on ready 
func _ready() -> void:
	player.movement.set_jump_force(JUMP_FORCE)
	get_window().content_scale_factor = 2.5
	for child in blocks.get_children():
		if child is Block:
			all_blocks.append(child)
	timer.start()

func _on_timer_timeout() -> void:
	if curr_block < all_blocks.size():
		all_blocks[curr_block].set_gravity()
		curr_block += NEXT_INDEX
