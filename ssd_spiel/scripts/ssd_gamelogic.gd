extends Node2D

var startTime
var miss_parkings = 0


var parking_positions
var full_parking_positions = [false, false, false, false, false, false, false, false, false, false, false, false]

var player1 = 0
var player2 = 0
var player3 = 0
var player4 = 0

func _ready():
	parking_positions = get_tree().get_nodes_in_group("parking_position")
	startTime = OS.get_ticks_usec()
	start_next_bus()


func bus_in_ride_spot(current_bus, zone):
	if current_bus == get_node("moveable_objects/bus_1") && zone == get_node("parking_positions/parking_position1"):
		return true
	if current_bus == get_node("moveable_objects/bus_2") && zone == get_node("parking_positions/parking_position2"):
		return true
	if current_bus == get_node("moveable_objects/bus_3") && zone == get_node("parking_positions/parking_position3"):
		return true
	if current_bus == get_node("moveable_objects/bus_4") && zone == get_node("parking_positions/parking_position4"):
		return true
	if current_bus == get_node("moveable_objects/bus_5") && zone == get_node("parking_positions/parking_position5"):
		return true
	if current_bus == get_node("moveable_objects/bus_6") && zone == get_node("parking_positions/parking_position6"):
		return true
	if current_bus == get_node("moveable_objects/bus_7") && zone == get_node("parking_positions/parking_position7"):
		return true
	if current_bus == get_node("moveable_objects/bus_8") && zone == get_node("parking_positions/parking_position8"):
		return true
	if current_bus == get_node("moveable_objects/bus_9") && zone == get_node("parking_positions/parking_position9"):
		return true
	if current_bus == get_node("moveable_objects/bus_10") && zone == get_node("parking_positions/parking_position10"):
		return true
	if current_bus == get_node("moveable_objects/bus_11") && zone == get_node("parking_positions/parking_position11"):
		return true
	if current_bus == get_node("moveable_objects/bus_12") && zone == get_node("parking_positions/parking_position12"):
		return true
	else: 
		return false
	


func park_bus(current_position, current_bus):
	var parked = false
	var count_position = 0
	for zone in parking_positions:
		var zone_position = zone.get_position()
		if current_position.distance_to(zone_position) < 55 && full_parking_positions[count_position] == false && bus_in_ride_spot(current_bus, zone):
			current_bus.is_parked = true
			full_parking_positions[count_position] = true
			current_bus.global_position = zone_position
			start_next_bus()
			parked = true
		count_position = count_position + 1
	if not parked: 
		miss_parkings = miss_parkings + 1
		current_bus.global_position = current_bus.original_position
		

func all_values_true(list):
	for value in list:
		if not value:
			return false
	return true


func start_next_bus():
	print("start next bus")
	if all_values_true(full_parking_positions):
		end_game()
	else:
		var start_point = floor(rand_range(0, 4))
		if start_point == 0 && player1 < 3:
			if player1 == 0:
				get_node("moveable_objects/bus_1").global_position = Vector2(1000, 310)
			elif player1 == 1:
				get_node("moveable_objects/bus_2").global_position = Vector2(1000, 310)
			else:
				get_node("moveable_objects/bus_3").global_position = Vector2(1000, 310)
			player1 = player1 + 1
		elif start_point == 1 && player2 < 3:
			if player2 == 0:
				get_node("moveable_objects/bus_4").global_position = Vector2(2000, 310)
			elif player2 == 1:
				get_node("moveable_objects/bus_5").global_position = Vector2(2000, 310)
			else:
				get_node("moveable_objects/bus_6").global_position = Vector2(2000, 310)
			player2 = player2 + 1
		elif start_point == 2 && player3 < 3:
			if player3 == 0:
				get_node("moveable_objects/bus_7").global_position = Vector2(1000, 1850)
			elif player3 == 1:
				get_node("moveable_objects/bus_8").global_position = Vector2(1000, 1850)
			else:
				get_node("moveable_objects/bus_9").global_position = Vector2(1000, 1850)
			player3 = player3 + 1
		elif start_point == 3 && player4 < 3:
			if player4 == 0:
				get_node("moveable_objects/bus_10").global_position = Vector2(2000, 1850)
			elif player4 == 1:
				get_node("moveable_objects/bus_11").global_position = Vector2(2000, 1850)
			else:
				get_node("moveable_objects/bus_12").global_position = Vector2(2000, 1850)
			player4 = player4 + 1
		else:
			start_next_bus()


func end_game():
	var endTime = OS.get_ticks_usec()
	var totalTime = (endTime -startTime) / 1000000.0
	var score
	
	if miss_parkings < 2 && totalTime < 40:
		print("3 Star: miss: ", miss_parkings, " time: ", totalTime)
		score = 3
	elif miss_parkings < 3 && totalTime < 70: 
		print("2 Stars: miss: ", miss_parkings, " Time: ", totalTime)
		score = 2
	else:
		print("1 stars: miss: ", miss_parkings, " Time: ", totalTime)
		score = 1
	GlobalVariables.setSsdScore(score)
	get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedSsd.tscn")
	


func _on_bus_1_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_2_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_3_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_4_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_5_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_6_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_7_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_8_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_9_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_10_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_11_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_12_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_Holly_pressed():
	get_tree().change_scene("res://Scenes/Holly/SSD_Help/SSD_Help.tscn")
