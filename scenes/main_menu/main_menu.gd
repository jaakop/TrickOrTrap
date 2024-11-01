extends Control

@export_file var mainScene: String;

func _on_button_2_pressed():
    get_tree().quit();
    pass # Replace with function body.

func _on_button_pressed():
    get_tree().change_scene_to_file(mainScene);
    pass # Replace with function body.
