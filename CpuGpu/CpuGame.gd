extends Node2D
signal gameComplete(score)

var count


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
	if(count < 12):
		score = 2
	if(count < 8):
		score = 3
	print("game complete!  score:")
	print(score)
	print(count)
	emit_signal("gameComplete", score)
	GlobalVariables.setCpuScore(score)
	yield(get_tree().create_timer(1.0),"timeout")
	get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedCpu.tscn")


func _on_Holly_pressed():
	get_tree().change_scene("res://Scenes/Holly/CPU_Help/CPU_Help_1.tscn")
