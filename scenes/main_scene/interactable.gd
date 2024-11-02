extends TextureButton

var initalScale;

@onready var hoverSound = $"/root/Global/buttonHover" as AudioStreamPlayer;

func _ready():
    initalScale = scale;
    mouse_entered.connect(onHover);
    mouse_exited.connect(onHoveExit);
    pass;

func onHover():
    var tween = get_tree().create_tween();
    tween.tween_property($".", "scale", initalScale * 1.05, 0.1);
    hoverSound.play();
    pass;
func onHoveExit():
    var tween = get_tree().create_tween();
    tween.tween_property($".", "scale", initalScale, 0.1);
    pass;