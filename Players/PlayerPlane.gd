class_name PlayerPlane
extends Area2D

const BulletScene := preload("res://Players/Bullet.tscn")

var _input_up: int = KEY_UP
var _input_left: int = KEY_LEFT
var _input_down: int = KEY_DOWN
var _input_right: int = KEY_RIGHT
var _input_shoot: int = KEY_ENTER
var _input_bomb: int = KEY_SHIFT
var _shoot_time: float = 0.125
var _bomb_time: float = 0.5
var BombScene
var data#: LevelWrapper.PlayerData

onready var screen_size: Vector2 = get_viewport_rect().size

func _physics_process(delta: float):
	var velocity: Vector2 = Vector2(0, 0)
	if Input.is_key_pressed(_input_left):
		velocity.x -= 1
	if Input.is_key_pressed(_input_right):
		velocity.x += 1
	if Input.is_key_pressed(_input_up):
		velocity.y -= 1
	if Input.is_key_pressed(_input_down):
		velocity.y += 1
	if 0 < velocity.length():
		velocity = velocity.normalized() * delta * 100
		position = vector2_clamp(position + velocity,
				Vector2(0, 0), screen_size)

	if Input.is_key_pressed(_input_shoot) and $BulletTimer.is_stopped():
		$BulletTimer.start(_shoot_time)
		_shoot()

	if Input.is_key_pressed(_input_bomb) and $BombTimer.is_stopped(): 
		$BombTimer.start(_bomb_time)
		_bomb()

func apply_damage(damage: int) -> void:
	data.recieve_damage(damage)

func _shoot():
	var bullet: Bullet = BulletScene.instance()
	bullet.position = position
	get_parent().add_child(bullet)

func _bomb():
	var bomb = BombScene.instance()
	bomb.position = position
	bomb.target_y = position.y + $Target.offset.y
	get_parent().add_child(bomb)

# Can I create some global helpers?
static func vector2_clamp(value: Vector2,
		minimum: Vector2, maximum: Vector2) -> Vector2:
	var x = clamp(value.x, minimum.x, maximum.x)
	var y = clamp(value.y, minimum.y, maximum.y)
	return Vector2(x, y)
