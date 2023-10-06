extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://speicher_spiele/ram_spiel/scenes/RAM_spiel_main.tscn") # replace with game scene

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/ComponentStories/RAM_Story/RAM_Story_1.tscn")
