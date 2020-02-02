extends Button

func _on_Start_pressed():
	LevelStatic.current_level = "TestLevel1"
	if 0 != get_tree().change_scene("res://Levels/LevelWrapper.tscn"):
		print("Could not start game!")
