@icon("res://entities/player/art/player-2.png")
class_name Player
extends Area2D
# Maybe you could shoot in only one direction
# Shoot very fast

const SPEED: float = 1.2
const TILT_SPEED: float = 0.15
const TILE_DISTANCE: float = 10.0

var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var seed_scene: PackedScene = preload("res://entities/projectiles/seed/seed.tscn")

@onready var seed_container: Node2D = %SeedContainer
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	direction = _get_direction()
	velocity = direction * SPEED
	_animate_tilt()

	position += velocity


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		_shoot()


func _get_direction() -> Vector2:
	var x: float = Input.get_axis("move_left", "move_right")
	var y: float = Input.get_axis("move_up", "move_down")
	return Vector2(x, y).normalized()


func _animate_tilt() -> void:
	sprite.rotation_degrees = lerp(sprite.rotation_degrees, TILE_DISTANCE * direction.x, TILT_SPEED)


func _shoot() -> void:
	print("Player shot.")
	seed_container.add_child(seed_scene.instantiate())
