extends TextureButton

@export_file var mainScene:String

func _on_pressed():
    get_tree().change_scene_to_file(mainScene);
    pass # Replace with function body.
