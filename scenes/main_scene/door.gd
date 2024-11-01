extends TextureRect
class_name Door

func _ready():
    pass;

func knock():
    var initialScale = scale;
    var tween = get_tree().create_tween();
    
    tween.tween_property($".", "scale",  initialScale * 1.05, .1);
    tween.tween_property($".", "scale",  initialScale, .1);
    tween.tween_property($".", "scale",  initialScale * 1.05, .1);
    tween.tween_property($".", "scale",  initialScale, .1);
    tween.tween_property($".", "scale",  initialScale * 1.05, .1);
    tween.tween_property($".", "scale",  initialScale, .1);

    # tween.play();
    pass;