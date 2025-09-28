class_name KillZone
extends Area2D

const DMG: int = 1

func _ready() -> void:
	SignalBus.connect("death_transition", respawn_player_pos)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.hitbox.curr_health =- DMG
		SignalBus.emit_signal("player_entered_killzone")

func respawn_player_pos() -> void: 
	# find reference to player
	var player = get_tree().get_first_node_in_group("player")
	# find reference to spawn area 
	var spawn_area = get_tree().get_first_node_in_group("spawn_areas")
	# move player to spawn area 
	player.global_position = spawn_area.global_position
