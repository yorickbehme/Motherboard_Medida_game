extends Node2D



func _ready():
	pass # Replace with function body.


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/Holly/GPU_Help/GPU_Help_3.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Holly/GPU_Help/GPU_Help_1.tscn")
