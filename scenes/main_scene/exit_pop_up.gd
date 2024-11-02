extends Control

@onready var shadow = $"./Shadow" as TextureRect;
@onready var popUp = $"./Panel" as Panel;

@export_file var mainMenuScene: String;

var popUpOpen: bool;

func _ready():
    popUpOpen = false;
    pass;

func _input(event):
    if(event is InputEventKey and event.pressed):
        if(event.keycode == KEY_ESCAPE):
                togglePopUp();
    pass;

func togglePopUp():
    popUpOpen = !popUpOpen;

    if(popUpOpen):
        shadow.show();
        popUp.show();
    else:
        shadow.hide();
        popUp.hide();
    pass;


func _on_no_button_pressed():
    togglePopUp();
    pass # Replace with function body.

func _on_yes_button_pressed():
    get_tree().change_scene_to_file(mainMenuScene);
    pass # Replace with function body.
