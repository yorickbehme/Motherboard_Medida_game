extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/MainStory/Story4.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/MainStory/Story2.tscn")
