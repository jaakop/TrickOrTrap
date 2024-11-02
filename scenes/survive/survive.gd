extends Control

@export_file var gameScene: String;
@onready var global = $"/root/Global" as Globals


func _on_button_pressed():
    global.currentCharacter = null;
    global.dayTime = -1;
    global.jinxes = 0;
    global.score = 0;

    get_tree().change_scene_to_file(gameScene);
    pass # Replace with function body.
