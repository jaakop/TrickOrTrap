extends Control

@onready var global = $"/root/Global" as Globals

@export var heads: Array[Texture2D]
@export var bodies: Array[Texture2D]
@export var evilHeads: Array[Texture2D]
@export var evilBodies: Array[Texture2D]

@onready var headSprite = $"./Character/Head" as Sprite2D
@onready var bodySprite = $"./Character/Body" as Sprite2D

func _ready():
    if(global.currentCharacter.generated == false ):
        generateCharacter();
    else:
        loadCharacter();
    pass;

func _process(delta):
    pass;

func loadCharacter():
    headSprite.texture = load(global.currentCharacter.faceTexture);
    bodySprite.texture = load(global.currentCharacter.bodyTexture);
    pass;

func generateCharacter():
    print("Generated new character")
    global.currentCharacter.generated = true;

    if(global.currentCharacter.evil):
        var isHeadEvil = false;
        if(randi_range(0, 1) == 1):
            isHeadEvil = true;
            headSprite.texture = evilHeads[randi_range(0, evilHeads.size() - 1)];
        else:
            headSprite.texture = heads[randi_range(0, heads.size() - 1)];
        if(!isHeadEvil || randi_range(0,1) == 1):
            bodySprite.texture = evilBodies[randi_range(0, evilBodies.size() - 1)];
        else:
            bodySprite.texture = bodies[randi_range(0, bodies.size() - 1)];
    else:
        headSprite.texture = heads[randi_range(0, heads.size() - 1)];
        bodySprite.texture = bodies[randi_range(0, bodies.size() - 1)];
    
    global.currentCharacter.faceTexture = headSprite.texture.resource_path;
    global.currentCharacter.bodyTexture = bodySprite.texture.resource_path;
    pass;
