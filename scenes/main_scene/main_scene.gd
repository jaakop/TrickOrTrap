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
