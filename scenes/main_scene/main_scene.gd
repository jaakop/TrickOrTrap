extends Control

@onready var global = $"/root/Global" as Globals

func _ready():
    if(global.currentCharacter == null):
        global.currentCharacter = Character.new();
        global.currentCharacter.generated = false;
        global.currentCharacter.evil = true;
    pass;

func _process(delta):
    pass;

func _on_light_switch_pressed():
    if(global.currentCharacter.evil):
        print("Evil character yeeted!");
    else:
        print("Good guy yeeted :C");
    generateNewCharacter();
    pass # Replace with function body.

func _on_handle_pressed():
    if(global.currentCharacter.evil):
        print("Evil character let in :c");
    else:
        print("Good guy let in!");
    generateNewCharacter();
    pass # Replace with function body.

func generateNewCharacter():
    global.currentCharacter.generated = false;
    global.currentCharacter.evil = randi_range(0,1) == 1;
    global.currentCharacter.faceTexture = "";
    global.currentCharacter.bodyTexture = "";
    pass;