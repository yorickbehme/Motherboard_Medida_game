extends Node2D



func _ready():
	pass # Replace with function body.


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/Holly/CPU_Help/CPU_Help_2.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://CpuGpu/CpuGame.tscn")
