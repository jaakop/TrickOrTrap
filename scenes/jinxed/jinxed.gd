extends Control


@export_file var mainMenuScene: String;

func _on_button_pressed():
    get_tree().change_scene_to_file(mainMenuScene);
    pass # Replace with function body.
