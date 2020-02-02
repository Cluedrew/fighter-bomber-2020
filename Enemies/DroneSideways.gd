extends "res://Enemies/Drone.gd"

enum Side {LEFT = -1, RIGHT = 1}

export(Side) var side = Side.LEFT

var speed = 100

func _ready():
	$Sprite.rotation_degrees = side * 90

func _physics_process(delta: float):
	position.x -= delta * speed * side
