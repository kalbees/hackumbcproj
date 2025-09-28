extends Area2D

# health const
const HEALTH: int = 1

# on ready variables
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# initialize area
func _ready() -> void:
	animated_sprite_2d.play("idle")

# when player enters area
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.hitbox.set_health(body.hitbox.curr_health + HEALTH)
		queue_free()
