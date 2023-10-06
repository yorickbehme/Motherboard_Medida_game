extends Node2D
signal gameFinished

var power1 = false
var power2 = false



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
		$LogicImage.animation = "on"
		emit_signal("gameFinished")
	else:
		$LogicImage.animation = "off"


