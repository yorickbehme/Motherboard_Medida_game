extends Node2D
signal updateState(power)

var power1 = false
var power2 = false
var onColor = Color(0, 0.81, 1)
var offColor = Color(0.01, 0.27, 0.56)


# Called when the node enters the scene tree for the first time.
func _ready():
	updateState()


func first(button_pressed):
	power1 = button_pressed
	updateState()

func second(button_pressed):
	power2 = button_pressed
	updateState()
	
func updateState():
	if(power1 && power2):
		$Wire.set_default_color(onColor)
	else:
		$Wire.set_default_color(offColor)
	emit_signal("updateState", power1 && power2)


