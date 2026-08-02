@icon("res://entities/projectiles/seed/art/seed.png")
class_name SeedProjectile
extends Area2D
# Add auto-fire?

const SPEED: float = 4


func _ready() -> void:
	top_level = true
	if "global_position" in get_parent():
		global_position = get_parent().global_position


func _physics_process(_delta: float) -> void:
	position.x += SPEED


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area.queue_free()
