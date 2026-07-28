class_name Player
extends Area2D

const SPEED: float = 1

var velocity := Vector2.ZERO


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = _get_direction()
	velocity = direction * SPEED

	position += velocity


func _get_direction() -> Vector2:
	var x: float = Input.get_axis("move_left", "move_right")
	var y: float = Input.get_axis("move_up", "move_down")
	return Vector2(x, y).normalized()
