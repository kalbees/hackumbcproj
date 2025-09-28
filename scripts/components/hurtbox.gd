class_name Hurtbox
extends Area2D

# default constants
const DMG: int = 1
const KILL: int = 3

var instant_kill: bool = false 

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		if instant_kill:
			area.take_dmg(KILL)
		else:
			area.take_dmg(DMG)
