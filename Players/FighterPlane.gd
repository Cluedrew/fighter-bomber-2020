extends "res://Players/PlayerPlane.gd"

func _init():
	_input_up = KEY_Q
	_input_left = KEY_MINUS
	_input_down = KEY_K
	_input_right = KEY_C
	_input_shoot = KEY_SPACE
	_input_bomb = KEY_V
	_shoot_time = 0.125
	BombScene = preload("res://Players/Bomblet.tscn")

# Requires an active level wrapper.
func _ready():
	LevelStatic.wrapper.fighter = self
	data = LevelStatic.wrapper.player_fighter
