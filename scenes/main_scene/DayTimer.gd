extends TextureProgressBar

@export var dayLength: float;
@export var timePerDay: float;
@export var minDayLenght: float;

@onready var global = $"/root/Global" as Globals

var dayEnded: bool;

signal day_ended

func _ready():
    dayLength -= timePerDay * global.day;
    
    if(dayLength < minDayLenght):
        dayLength = minDayLenght;

    if(global.dayTime <= 0):
        global.dayTime = dayLength;
    
    dayEnded = false;
    pass;

func _process(delta):
    value = global.dayTime / dayLength * 100;
    global.dayTime -= delta;

    if(global.dayTime < 0 && !dayEnded):
        day_ended.emit();
        dayEnded = true;
        return
    pass;