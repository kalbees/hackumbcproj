extends ColorRect

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# play animation
func _ready() -> void:
	SignalBus.connect("player_entered_killzone", play_fade_to_black)

func play_fade_to_black() -> void:
	animation_player.play("fade_to_black")
	SignalBus.emit_signal("death_transition")
	animation_player.play("fade_from_black")
