extends Node

# Hardcoding this for now (could change in full game):
const ground_speed = 50

# I don't know what ommitting either of get/set does.
var current_level: String = "" setget set_current_level, get_current_level
var wrapper: LevelWrapper = null

func get_level_instance() -> Node: # Level?
	var scene: PackedScene = load(level_path(current_level))
	return scene.instance()

func level_path(level: String) -> String:
	return "res://Levels/" + level + ".tscn"

func set_current_level(level: String):
	var file = File.new()
	if not file.file_exists(level_path(level)):
		print("File does not exist! '" + level + "'")
	else:
		current_level = level

func get_current_level() -> String:
	return current_level

# This would just be extra checks to make sure it is used properly.
func set_wrapper(new_wrapper: LevelWrapper) -> void:
	if new_wrapper:
		assert(wrapper is null)
	else:
		assert(wrapper)
	wrapper = new_wrapper

func get_wrapper() -> LevelWrapper:
	assert(wrapper)
	return wrapper
