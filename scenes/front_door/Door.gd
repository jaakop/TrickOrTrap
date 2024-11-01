extends Node2D

@export_file var characterScene:String

func _on_texture_button_pressed():
    get_tree().change_scene_to_file(characterScene);
    pass # Replace with function body.
