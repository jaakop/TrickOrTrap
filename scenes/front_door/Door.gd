extends Node

@export_file var characterScene:String

func _on_window_button_pressed():
	get_tree().change_scene_to_file(characterScene);
	pass # Replace with function body.
