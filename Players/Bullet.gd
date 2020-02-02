class_name Bullet
extends Area2D

var speed: float = 200
#var damage : int = 1

func _physics_process(delta: float):
	position.y -= speed * delta
	if position.y < 0:
		queue_free()
