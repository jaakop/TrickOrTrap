extends Button


@onready var hoverSound = $"/root/Global/buttonHover" as AudioStreamPlayer;
@onready var clickSound = $"/root/Global/buttonClick" as AudioStreamPlayer;

func _ready():
	mouse_entered.connect(onHover);
	pressed.connect(onPressed);
	pass;

func onHover():
	hoverSound.play();
	print("debug");
	pass;
func onPressed():
	clickSound.play();
	pass;
