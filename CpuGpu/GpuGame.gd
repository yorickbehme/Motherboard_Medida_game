extends Node2D
signal gameComplete(score)

var count
var power1 = false
var power2 = false
var power4 = false
var power3 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	count = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pressed(button_pressed):
	count = count +1
	
func end():
	var score = 1
	if(count < 25):
		score = 2
	if(count < 17):
		score = 3
	print("game complete!  score:")
	print(score)
	print(count)
	emit_signal("gameComplete", score)
	GlobalVariables.setGpuScore(score)
	yield(get_tree().create_timer(1.0),"timeout")
	get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedGpu.tscn")

func first(button_pressed):
	power1 = button_pressed
	updateState()

func second(button_pressed):
	power2 = button_pressed
	updateState()
	
func third(button_pressed):
	power3 = button_pressed
	updateState()
	
func fourth(button_pressed):
	power4 = button_pressed
	updateState()
	
func updateState():
	if(power1 && power2 && power3 && power4):
		end()



func _on_Holly_pressed():
	get_tree().change_scene("res://Scenes/Holly/GPU_Help/GPU_Help_1.tscn")
