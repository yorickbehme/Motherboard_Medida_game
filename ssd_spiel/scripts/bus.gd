extends Node2D

signal drag_started
signal drag_ended(position, current_bus)

var is_parked = false

var selected = false
var touch_pos = self.global_position

var original_position



func _physics_process(delta): #Anpassen für touch
	if selected and not is_parked:
		self.global_position = touch_pos




func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not is_parked: 
		if event.is_pressed():
			self.set_z_index(2)
			selected = true
			original_position = self.global_position
			emit_signal("drag_started")
			print("drag_started")
		else: 
			selected = false
			self.set_z_index(0)
			emit_signal("drag_ended", self.global_position, self)
			print("drag_ended")
	if selected and not is_parked:
		touch_pos = event.position


