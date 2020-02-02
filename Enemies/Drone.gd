extends Enemy

func _init():
	max_health = 50

func _physics_process(delta: float):
	position.y += delta * LevelStatic.ground_speed

func _on_Drone_area_entered(area):
	var bullet = area as Bullet
	if bullet:
		apply_damage(3)
		area.queue_free()
	var plane = area as PlayerPlane
	if plane:
		apply_damage(10)
		plane.apply_damage(10)
