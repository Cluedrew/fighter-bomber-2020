class_name BombExplosion
extends Area2D

var damage: int = 5

func _physics_process(delta: float):
	position.y += delta * LevelStatic.ground_speed

func _on_Timer_timeout():
	queue_free()
