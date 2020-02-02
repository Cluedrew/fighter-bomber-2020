class_name LevelWrapper
extends Control

var player_fighter: PlayerData = PlayerData.new()
var player_bomber: PlayerData = PlayerData.new()

var fighter setget set_player_fighter_plane, get_player_fighter_plane
var bomber setget set_player_bomber_plane, get_player_bomber_plane

func _ready():
	player_fighter.health_bar = $FighterHealth
	player_bomber.health_bar = $BomberHealth
	var level :Node = LevelStatic.get_level_instance()
	add_child(level)

func _enter_tree():
	LevelStatic.wrapper = self

func _exit_tree():
	LevelStatic.wrapper = null

func get_players():
	return [player_fighter.plane, player_bomber.plane]

class PlayerData:
	var plane: PlayerPlane
	var health: int = 100
	var health_bar: ProgressBar
	
	func recieve_damage(damage: int):
		health = clamp(health - damage, 0, 100) as int
		health_bar.value = health

func set_player_fighter_plane(plane: PlayerPlane):
	player_fighter.plane = plane

func get_player_fighter_plane() -> PlayerPlane:
	return player_fighter.plane

func set_player_bomber_plane(plane: PlayerPlane):
	player_bomber.plane = plane

func get_player_bomber_plane() -> PlayerPlane:
	return player_fighter.plane
