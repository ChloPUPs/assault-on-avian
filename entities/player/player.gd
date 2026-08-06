@icon("res://entities/player/art/player-2.png")
class_name Player
extends Area2D

const SPEED: float = 1.2
const TILT_SPEED: float = 0.15
const TILE_DISTANCE: float = 10.0

var velocity := Vector2.ZERO
var _seed_scene: PackedScene = preload("res://entities/projectiles/seed/seed.tscn")

@onready var _seed_container: Node2D = %SeedContainer
@onready var _sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var _auto_fire_cooldown: Timer = %AutoFireCooldown


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = _get_direction()
	_animate_tilt(direction)
	velocity = direction * SPEED
	position += velocity


func _process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") and _auto_fire_cooldown.is_stopped():
		_shoot()


func _get_direction() -> Vector2:
	var x: float = Input.get_axis("move_left", "move_right")
	var y: float = Input.get_axis("move_up", "move_down")
	return Vector2(x, y).normalized()


func _animate_tilt(direction: Vector2) -> void:
	_sprite.rotation_degrees = lerp(_sprite.rotation_degrees, TILE_DISTANCE * direction.x, TILT_SPEED)


func _shoot() -> void:
	print("Player shot.")
	_seed_container.add_child(_seed_scene.instantiate())
	_auto_fire_cooldown.start()
