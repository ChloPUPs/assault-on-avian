@icon("res://entities/enemies/leaf/art/leaf_icon.png")
class_name LeafEnemy
extends Area2D

const SPEED: float = 1


func _physics_process(_delta: float) -> void:
	position.x -= SPEED


func _on_area_entered(area: Area2D) -> void:
	# Confirm playerness
	var player := area as Player
	if not player:
		return

	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
