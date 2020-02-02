class_name Enemy #, "An icon might be nice"
extends Area2D

const Explosion = preload("res://Players/BombExplosion.tscn")

var max_health: int = 100
var cur_health: int = 1

signal defeated

func _ready():
	cur_health = max_health

func apply_damage(damage: int) -> void:
	cur_health = clamp(cur_health - damage, 0, max_health) as int
	if 0 == cur_health:
		emit_signal("defeated")
		despawn()

# Default defeated responce.
func despawn():
	var explosion = Explosion.instance()
	explosion.position = position
	get_parent().call_deferred("add_child", explosion)
	queue_free()
