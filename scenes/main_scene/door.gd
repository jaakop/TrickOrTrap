extends TextureRect
class_name Door

@onready var highlight = $"Window/Highlight" as Highlight;

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
	tween.tween_callback(highlight.startTween);
	# tween.play();
	pass;
