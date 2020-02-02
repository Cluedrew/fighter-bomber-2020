extends Area2D

var speed: int = 100
var damage: int = 1

func _physics_process(delta: float):
	position += Vector2(0, speed * delta).rotated(rotation)

func _on_TankRound_area_entered(area: PlayerPlane):
	if area:
		area.apply_damage(damage)
		queue_free()
