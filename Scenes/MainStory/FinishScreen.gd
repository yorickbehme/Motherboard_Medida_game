extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/LevelSelection/LevelSelect.tscn")


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Scenes/LevelSelection/LevelSelect.tscn")
