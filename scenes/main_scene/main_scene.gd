extends Control

@export var timeMin: float;
@export var timeMax: float;

@export_file var characherScene: String;

@export var shadow: TextureRect;

@onready var global = $"/root/Global" as Globals
@onready var timer = $"./Timer" as Timer;

@onready var door = $"./Door" as Door;

var characterReady: bool;

var lightTimer: float;
@export var lightLength: float; 

func _ready():
    if(global.currentCharacter == null):
        global.currentCharacter = Character.new();
        startCharacterTimer();
        
    pass;

func _process(delta):
    if(lightTimer > 0):
        lightTimer -= delta;
        if(lightTimer < 0):
            shadow.hide();
            startCharacterTimer();
    pass;

func _on_light_switch_pressed():
    if(global.currentCharacter.evil):
        print("Evil character yeeted!");
    else:
        print("Good guy yeeted :C");

    shadow.show();
    lightTimer = lightLength;
    pass # Replace with function body.

func _on_handle_pressed():
    if(global.currentCharacter.evil):
        print("Evil character let in :c");
    else:
        print("Good guy let in!");
    startCharacterTimer();
    pass # Replace with function body.

func _on_texture_button_pressed():
    if(!characterReady):
        return;
    get_tree().change_scene_to_file(characherScene);
    pass # Replace with function body.

func _on_timer_timeout():
    characterReady = true;
    generateNewCharacter();
    door.knock();
    pass # Replace with function body.

func generateNewCharacter():
    global.currentCharacter.generated = false;
    global.currentCharacter.evil = randi_range(0,1) == 1;
    global.currentCharacter.faceTexture = "";
    global.currentCharacter.bodyTexture = "";
    pass;

func startCharacterTimer():
    characterReady = false;

    timer.wait_time = randf_range(timeMin, timeMax);
    timer.start();
    pass;


func _on_day_timer_day_ended():
    print("Day ended!")
    pass # Replace with function body.
