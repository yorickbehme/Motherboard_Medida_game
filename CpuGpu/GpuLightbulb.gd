extends Node2D
signal updateState(power)

var power = false

# Called when the node enters the scene tree for the first time.
func _ready():
	updateState()


func first(button_pressed):
	power = button_pressed
	updateState()


	
func updateState():
	if(power):
		$LogicImage.animation = "on"
	else:
		$LogicImage.animation = "off"
	emit_signal("updateState", power)



