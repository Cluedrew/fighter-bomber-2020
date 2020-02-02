class_name Bomb
extends AnimatedSprite

export(int) var damage = 20
var speed: float = 150
var target_y: float = 0

const ExplosionScene = preload("res://Players/BombExplosion.tscn")

func _physics_process(delta: float):
	position.y -= speed * delta
	target_y += delta * LevelStatic.ground_speed
	if position.y < target_y:
		var explosion = ExplosionScene.instance()
		explosion.position = position
		explosion.damage = damage
		# TODO: Make the explosion a child of the ground
		get_parent().add_child(explosion)
		queue_free()
