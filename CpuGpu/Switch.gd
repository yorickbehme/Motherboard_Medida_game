extends CheckButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var onColor = Color(0, 0.81, 1)
var offColor = Color(0.01, 0.27, 0.56)


# Called when the node enters the scene tree for the first time.
func _ready():
	updateState(self.pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateState(button_pressed):
	if(button_pressed):
		$Wire.set_default_color(onColor)
	else:
		$Wire.set_default_color(offColor)


func _on_TouchScreenButton_released():
	self.pressed = !self.pressed

