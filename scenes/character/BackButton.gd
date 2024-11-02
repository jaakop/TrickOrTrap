extends TextureButton

@export_file var mainScene:String
@onready var highLight = $"./Highlight" as Highlight

func _on_pressed():
	get_tree().change_scene_to_file(mainScene);
	pass # Replace with function body.

var initalScale;

func _ready():
	initalScale = scale;
	mouse_entered.connect(onHover);
	mouse_exited.connect(onHoveExit);
	highLight.startTween();
	pass;

func onHover():
	var tween = get_tree().create_tween();
	tween.tween_property($".", "scale", initalScale * 1.05, 0.1);
	pass;
func onHoveExit():
	var tween = get_tree().create_tween();
	tween.tween_property($".", "scale", initalScale, 0.1);
	pass;