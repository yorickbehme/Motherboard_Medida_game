extends Control

var score = 3

var star_texture_1 = load("res://Assets/stars_1.png")
var star_texture_2 = load("res://Assets/stars_2.png")
var star_texture_3 = load("res://Assets/stars_3.png")
var text_texture_well_done = load("res://Assets/well_done_ram_ssd.png")
var text_texture_perfect = load("res://Assets/perfect_ram_ssd.png")
var component_texture_happy = load("res://Assets/ssd_happy.png")
var component_texture_excited = load("res://Assets/ssd_excited.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var score = GlobalVariables.ssdScore
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
	GlobalVariables.setSsdScore(GlobalVariables.bestSsdScore)
	get_tree().change_scene("res://Scenes/LevelSelection/LevelSelect.tscn")


func _on_PlayAgainButton_pressed():
	GlobalVariables.setSsdScore(GlobalVariables.bestSsdScore)
	get_tree().change_scene("res://speicher_spiele/ssd_spiel/scenes/SSD_spiel_main.tscn") # replace with game scene
