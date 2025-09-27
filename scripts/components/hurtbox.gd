class_name Hurtbox
extends Area2D

# default constants
const DMG: int = 1

# deal damage to entering hitboxes
func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		area.take_dmg(DMG)
