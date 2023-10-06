extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/ComponentStories/GPU_Story/GPU_Story_5.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/ComponentStories/GPU_Story/GPU_Story_3.tscn")
