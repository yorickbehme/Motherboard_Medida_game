extends Position2D


func _draw():
	draw_circle(Vector2.ZERO, 40, Color.white)
	
func select():
	for node in get_tree().get_nodes_in_group("parking_position"):
		node.deselect()
	modulate = Color.white
	
func deselect():
	modulate = Color.white
