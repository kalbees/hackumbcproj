extends Area2D

# on ready variables
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# initialize area
func _ready() -> void:
	animated_sprite_2d.play("inactive")

# make grapple available 
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		animated_sprite_2d.play("active")
		SignalBus.emit_signal("player_can_grapple", animated_sprite_2d.global_position)

# make grapple unavailable 
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		animated_sprite_2d.play("inactive")
		SignalBus.emit_signal("player_cannot_grapple")
