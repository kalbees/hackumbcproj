extends Node

# signal bus 

@warning_ignore_start("unused_signal")
signal player_died
signal player_connect
signal player_interact
signal player_can_grapple(pos: Vector2)
signal player_cannot_grapple
signal player_change_port
signal player_respawn
signal player_entered_killzone
signal death_transition
