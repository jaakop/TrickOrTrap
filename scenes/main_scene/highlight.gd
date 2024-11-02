extends TextureRect
class_name Highlight

@export var scaleFactor: float;
@export var tweenDuration: float;

var initialScale;

var tween;

func _ready():
	initialScale = scale;
	scale = Vector2(0,0);

func startTween():
	scale = Vector2(0,0)

	tween = get_tree().create_tween();

	tween.tween_property($".", "scale",  initialScale * scaleFactor, tweenDuration);
	tween.tween_property($".", "scale",  initialScale, tweenDuration);
	tween.set_loops();

func stopTween():
	var hideTween = get_tree().create_tween();
	hideTween.tween_property($".", "scale", Vector2(0,0), tweenDuration);
	hideTween.tween_callback(hide);
