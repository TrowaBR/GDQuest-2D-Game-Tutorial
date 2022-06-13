tool
extends Button

export(String, FILE) var next_scene_path: = ""

func _on_button_up():
	get_tree().paused = false # Bugfix not to freeze after leave to main menu
	if get_tree().change_scene(next_scene_path) != OK:
		print ("An unexpected error occured when trying to switch the scene!")

func _get_configuration_warning():
	return "Property \"next_scene_path\" can't be empty." if next_scene_path == "" else ""
