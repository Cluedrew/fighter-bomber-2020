extends Enemy

const BulletScene := preload("res://Enemies/TankRound.tscn")

var targeting: Node2D = null
var level: LevelWrapper = LevelStatic.wrapper

onready var screen_size: Vector2 = get_viewport_rect().size

func _init():
	max_health = 30

func _ready():
	choose_target()

func _process(_delta: float):
	if targeting:
		$Cannon.look_at(targeting.position)

func _physics_process(delta: float):
	position.y += delta * LevelStatic.ground_speed
	if position.y > screen_size.y + 32:
		queue_free()

func choose_target():
	match level.get_players():
		[var p1, var p2]:
			var d1 := position.distance_squared_to(p1.position)
			var d2 := position.distance_squared_to(p2.position)
			if d1 < d2:
				targeting = p1
			else:
				targeting = p2

func fire_cannon():
	var bullet = BulletScene.instance()
	bullet.position = position
	bullet.rotate(($Cannon/Sprite as Node2D).global_rotation)
	get_parent().add_child(bullet)

# This is a filter, area is null unless it is an explosion.
func _on_Tank_area_entered(area: BombExplosion):
	if area:
		apply_damage(area.damage)

func _on_FireTimer_timeout():
	fire_cannon()
	choose_target()
