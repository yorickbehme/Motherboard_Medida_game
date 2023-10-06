extends Control

var score = 3

var star_texture_1 = load("res://Assets/stars_1.png")
var star_texture_2 = load("res://Assets/stars_2.png")
var star_texture_3 = load("res://Assets/stars_3.png")
var text_texture_well_done = load("res://Assets/well_done_cpu_gpu.png")
var text_texture_perfect = load("res://Assets/perfect_cpu_gpu.png")
var component_texture_happy = load("res://Assets/gpu_happy.png")
var component_texture_excited = load("res://Assets/gpu_excited.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var score = GlobalVariables.gpuScore
	var stars = get_node("Stars")
	var finishedText = get_node("FinishedText")
	var component = get_node("Component")
	
	if score == 1:
		stars.set_texture(star_texture_1)
		finishedText.set_texture(text_texture_well_done)
		component.set_texture(component_texture_happy)
	elif score == 2:
		stars.set_texture(star_texture_2)
		finishedText.set_texture(text_texture_well_done)
		component.set_texture(component_texture_happy)
	elif score == 3:
		stars.set_texture(star_texture_3)
		finishedText.set_texture(text_texture_perfect)
		component.set_texture(component_texture_excited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DoneButton_pressed():
	# make sure the score is set to the previous max when closing the level
	GlobalVariables.setGpuScore(GlobalVariables.bestGpuScore)
	get_tree().change_scene("res://Scenes/LevelSelection/LevelSelect.tscn")


func _on_PlayAgainButton_pressed():
	GlobalVariables.setGpuScore(GlobalVariables.bestGpuScore)
	get_tree().change_scene("res://CpuGpu/GpuGame.tscn") # replace with game scene
