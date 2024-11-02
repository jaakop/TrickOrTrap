extends Control

@onready var global = $"/root/Global" as Globals

@export var characters: Array[CharacterPreset]

@onready var characterNode = $"./Character" as Node2D;

func _ready():
    if (global.currentCharacter.generated == false):
        generateCharacter();
    else:
        loadCharacter();
    pass ;

func _process(delta):
    pass ;

func loadCharacter():
    var scene = load(global.currentCharacter.preset) as PackedScene;
    characterNode.replace_by(scene.instantiate());

    var headSprite = $"./Character/Head" as Sprite2D;
    var bodySprite = $"./Character/Body" as Sprite2D;
    
    headSprite.texture = load(global.currentCharacter.faceTexture);
    bodySprite.texture = load(global.currentCharacter.bodyTexture);
    pass ;

func generateCharacter():
    print("Generated new character")
    global.currentCharacter.generated = true;

    var character = characters[randi_range(0, characters.size() - 1)];

    var scene = load(character.presetScene) as PackedScene;
    characterNode.replace_by(scene.instantiate());

    var headSprite = $"./Character/Head" as Sprite2D;
    var bodySprite = $"./Character/Body" as Sprite2D;
    
    if (global.currentCharacter.evil):
        var isHeadEvil = false;
        if (randi_range(0, 1) == 1):
            isHeadEvil = true;
            headSprite.texture = character.evilHeads[randi_range(0, character.evilHeads.size() - 1)];
        else:
            headSprite.texture = character.heads[randi_range(0, character.heads.size() - 1)];
        if (!isHeadEvil || randi_range(0, 1) == 1):
            bodySprite.texture = character.evilBodies[randi_range(0, character.evilBodies.size() - 1)];
        else:
            bodySprite.texture = character.bodies[randi_range(0, character.bodies.size() - 1)];
    else:
        headSprite.texture = character.heads[randi_range(0, character.heads.size() - 1)];
        bodySprite.texture = character.bodies[randi_range(0, character.bodies.size() - 1)];
    
    global.currentCharacter.preset = character.presetScene;
    global.currentCharacter.faceTexture = headSprite.texture.resource_path;
    global.currentCharacter.bodyTexture = bodySprite.texture.resource_path;
    pass ;
