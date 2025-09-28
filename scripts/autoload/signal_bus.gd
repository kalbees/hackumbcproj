extends Node

# signal bus, autoload
@warning_ignore_start("unused_signal") 
signal player_died
signal player_hp_changed(changed: int)
signal player_connect
signal player_interact
signal player_can_grapple(pos: Vector2)
signal player_cannot_grapple
signal player_change_port(cord: PlayerDataManager.Cords)
signal player_respawn
signal player_entered_killzone
signal death_transition
signal player_save_to_manager
signal player_load_from_manager
signal level_transition
signal puzzle_solved
signal player_won
