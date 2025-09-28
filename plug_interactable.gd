extends Area2D

@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var timer: Timer = $Timer

func _ready() -> void:
	rich_text_label.hide()
	SignalBus.connect("player_interact", light_up)
	
func light_up() -> void: 
	rich_text_label.show()

func _on_timer_timeout() -> void:
	rich_text_label.hide()
