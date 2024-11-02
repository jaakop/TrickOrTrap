extends Control

@export_file var mainScene: String;
@onready var global = $"/root/Global" as Globals

func _ready():
    global.currentCharacter = null;
    global.dayTime = -1;
    global.jinxes = 0;
    global.day = 1;
    global.score = 0;
    pass;

func _on_button_2_pressed():
    get_tree().quit();
    pass # Replace with function body.

func _on_button_pressed():
    get_tree().change_scene_to_file(mainScene);
    pass # Replace with function body.
