extends Area2D

# on ready
func _ready() -> void:
	spawn_player()
	# connect respawn signal
	SignalBus.connect("player_respawn", spawn_player)

func spawn_player() -> void:
	# create a new player instance 
	var new_player = preload("res://scenes/entity/player.tscn").instantiate()
	# add player to tree
	get_tree().get_root().call_deferred("add_child", new_player)
	# set player pos
	new_player.global_position = global_position
