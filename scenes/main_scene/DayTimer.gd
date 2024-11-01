extends TextureProgressBar

@export var dayLength: float;

var timer: float;

var dayEnded: bool;

signal day_ended

func _ready():
    timer = dayLength;
    dayEnded = false;
    pass;

func _process(delta):
    value = timer / dayLength * 100;
    timer -= delta;

    if(timer < 0 && !dayEnded):
        day_ended.emit();
        dayEnded = true;
        return
    pass;