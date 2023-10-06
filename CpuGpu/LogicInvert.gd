extends Node2D
signal updateState(power)

var power = false

var onColor = Color(0, 0.81, 1)
var offColor = Color(0.01, 0.27, 0.56)


# Called when the node enters the scene tree for the first time.
func _ready():
	updateState()


func first(button_pressed):
	power = button_pressed
	updateState()


	
func updateState():
	if(power):
		$Wire.set_default_color(offColor)
		if($LogicImages):
			$LogicImages.animation = "off"
	else:
		$Wire.set_default_color(onColor)
		if($LogicImages):
			$LogicImages.animation = "on"
	emit_signal("updateState", !power)
