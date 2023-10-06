extends Node2D



func _ready():
	pass # Replace with function body.


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/ComponentStories/CPU_Story/CPU_Story_2.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/LevelSelection/LevelSelect.tscn")
