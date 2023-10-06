extends Node2D

var startTime
var miss_parkings = 0


var parking_positions
var full_parking_positions = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

var player1 = 0
var player2 = 0
var player3 = 0
var player4 = 0

func _ready():
	parking_positions = get_tree().get_nodes_in_group("parking_position")
	startTime = OS.get_ticks_usec()
	start_next_bus()


func park_bus(current_position, current_bus):
	var parked = false
	var count_position = 0
	for zone in parking_positions:
		var zone_position = zone.get_position()
		if current_position.distance_to(zone_position) < 55 && full_parking_positions[count_position] == false:
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
		print("ende")
		end_game()
	else:
		var start_point = floor(rand_range(0, 4))
		if start_point == 0 && player1 < 4:
			if player1 == 0:
				get_node("bus_nodes/bus_1").global_position = Vector2(1000, 310)
			elif player1 == 1:
				get_node("bus_nodes/bus_2").global_position = Vector2(1000, 310)
			elif player1 == 2:
				get_node("bus_nodes/bus_3").global_position = Vector2(1000, 310)
			else:
				get_node("bus_nodes/bus_4").global_position = Vector2(1000, 310)
			player1 = player1 + 1
		elif start_point == 1 && player2 < 4:
			if player2 == 0:
				get_node("bus_nodes/bus_5").global_position = Vector2(2000, 310)
			elif player2 == 1:
				get_node("bus_nodes/bus_6").global_position = Vector2(2000, 310)
			elif player2 == 2:
				get_node("bus_nodes/bus_7").global_position = Vector2(2000, 310)
			else:
				get_node("bus_nodes/bus_8").global_position = Vector2(2000, 310)
			player2 = player2 + 1
		elif start_point == 2 && player3 < 4:
			if player3 == 0:
				get_node("bus_nodes/bus_9").global_position = Vector2(1000, 1850)
			elif player3 == 1:
				get_node("bus_nodes/bus_10").global_position = Vector2(1000, 1850)
			elif player3 == 2:
				get_node("bus_nodes/bus_11").global_position = Vector2(1000, 1850)
			else:
				get_node("bus_nodes/bus_12").global_position = Vector2(1000, 1850)
			player3 = player3 + 1
		elif start_point == 3 && player4 < 4:
			if player4 == 0:
				get_node("bus_nodes/bus_13").global_position = Vector2(2000, 1850)
			elif player4 == 1:
				get_node("bus_nodes/bus_14").global_position = Vector2(2000, 1850)
			elif player4 == 2:
				get_node("bus_nodes/bus_15").global_position = Vector2(2000, 1850)
			else:
				get_node("bus_nodes/bus_16").global_position = Vector2(2000, 1850)
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
	GlobalVariables.setRamScore(score)
	get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedRam.tscn")


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


func _on_bus_13_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_14_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_15_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_bus_16_drag_ended(position, current_bus):
	park_bus(position, current_bus)


func _on_Holly_pressed():
	get_tree().change_scene("res://Scenes/Holly/RAM_Help/RAM_Help.tscn")
