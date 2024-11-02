extends Control

@export var timeMin: float;
@export var timeMax: float;

@export var minScore: int;

@export_file var characherScene: String;
@export_file var deathScene: String;
@export_file var jinxedScene: String;
@export_file var survivedScene: String;

@export var shadow: TextureRect;

@export var maxHealth: int;

@onready var global = $"/root/Global" as Globals
@onready var timer = $"./Timer" as Timer;

@onready var door = $"./Door" as Door;
@onready var doorSound = $"./Door/Handle/DoorSound" as AudioStreamPlayer;
@onready var knockSound = $"./Door/knockSound" as AudioStreamPlayer;
@onready var handle = $"./Door/Handle/Highlight" as Highlight;
@onready var lightSwitch = $"./LightSwitch/Highlight" as Highlight;
@onready var lightSound = $"./LightSwitch/LightSwitchSound" as AudioStreamPlayer;

@onready var jinxMeter = $"./JinxMeter" as JinxMeter

var characterReady: bool;

var lightTimer: float;
@export var lightLength: float; 

func _ready():
    jinxMeter.setJinxLevel(global.jinxes);
    
    if(global.currentCharacter == null):
        global.currentCharacter = Character.new();
        startCharacterTimer();
        return;
    else:
        handle.startTween();
        lightSwitch.startTween();
    characterReady = true;
    pass;

func _process(delta):
    if(lightTimer > 0):
        lightTimer -= delta;
        if(lightTimer < 0):
            lightSound.play();
            shadow.hide();
            startCharacterTimer();
    pass;

func _on_light_switch_pressed():
    if(!characterReady):
        return;

    lightSound.play();

    if(global.currentCharacter.evil):
        print("Evil character sent out")
    else:
        updateLives(1);

    handle.stopTween();
    lightSwitch.stopTween();
    shadow.show();
    lightTimer = lightLength;
    pass # Replace with function body.

func _on_handle_pressed():
    if(!characterReady):
        return;

    doorSound.play();

    if(global.currentCharacter.evil):
        get_tree().change_scene_to_file(deathScene);
        return;
    else:
        global.score += 1;
    
    handle.stopTween();
    lightSwitch.stopTween();
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
    knockSound.play();
    pass # Replace with function body.

func _on_day_timer_day_ended():
    if(global.jinxes >= maxHealth || global.score < minScore):
        get_tree().change_scene_to_file(jinxedScene);
        return;

    global.day += 1;
    get_tree().change_scene_to_file(survivedScene);
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

func updateLives(delta: int):
    global.jinxes += delta;
    jinxMeter.setJinxLevel(global.jinxes);

    if(global.jinxes >= maxHealth):
        print("Neighbors are not happy >:c");
    pass;
