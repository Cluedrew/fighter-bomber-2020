extends "res://Players/PlayerPlane.gd"

func _init():
	_shoot_time = 0.25
	BombScene = preload("res://Players/Bomb.tscn")

# Requires an active level wrapper.
func _ready():
	LevelStatic.wrapper.bomber = self
	data = LevelStatic.wrapper.player_bomber
