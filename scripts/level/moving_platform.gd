extends StaticBody2D

# initial animation
@export var initial_animation: String

# on ready variables 
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# on ready
func _ready() -> void:
	animation_player.play(initial_animation)

# when animation finishes, switch to the other version 
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "move_left":
		animation_player.play("move_right")
	if anim_name == "move_right":
		animation_player.play("move_left")
