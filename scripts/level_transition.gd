extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	SignalBus.connect("level_transition", play_transition)

func play_transition() -> void: 
	animation_player.play("fade_to_black")
	animation_player.play("fade_from_black")
