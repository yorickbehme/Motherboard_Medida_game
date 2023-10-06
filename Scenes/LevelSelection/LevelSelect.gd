extends Control

var finishedCpu = false
var finishedGpu = false
var finishedRam = false
var finishedSsd = false

func _ready():
	
	# components story lines are complete when their score is greater than 0
	finishedCpu = GlobalVariables.bestCpuScore > 0
	finishedGpu = GlobalVariables.bestGpuScore > 0
	finishedRam = GlobalVariables.bestRamScore > 0
	finishedSsd = GlobalVariables.bestSsdScore > 0
	
	var cpuOutside = get_node("CPU")
	var cpuMounted = get_node("CpuMounted")
	var cpuPlaceholder = get_node("CpuPlaceholder")
	var gpuOutside = get_node("GPU")
	var gpuMounted = get_node("GpuMounted")
	var gpuPlaceholder = get_node("GpuPlaceholder")
	var ramOutside = get_node("RAM")
	var ramMounted = get_node("RamMounted")
	var ramPlaceholder = get_node("RamPlaceholder")
	var ssdOutside =  get_node("SSD")
	var ssdMounted = get_node("SsdMounted")
	var motherboardHappy = get_node("MotherBoardFaceHappy")
	var motherboardSad = get_node("MotherBoardFaceSad")
	var larryHappy = get_node("LarryHappy")
	var larrySad = get_node("LarrySad")
	var restartButton = get_node("RestartButton")
	
	if finishedCpu:
		cpuOutside.visible = false
		cpuMounted.visible = true
		cpuPlaceholder.visible = false
	else:
		cpuOutside.visible = true
		cpuMounted.visible = false
		cpuPlaceholder.visible = true
	
	if finishedGpu:
		gpuOutside.visible = false
		gpuMounted.visible = true
		gpuPlaceholder.visible = false
	else:
		gpuOutside.visible = true
		gpuMounted.visible = false
		gpuPlaceholder.visible = true
	
	if finishedRam:
		ramOutside.visible = false
		ramMounted.visible = true
		ramPlaceholder.visible = false
	else:
		ramOutside.visible = true
		ramMounted.visible = false
		ramPlaceholder.visible = true
		
	if finishedSsd:
		ssdOutside.visible = false
		ssdMounted.visible = true
	else:
		ssdOutside.visible = true
		ssdMounted.visible = false
	
	if finishedCpu and finishedGpu and finishedRam and finishedSsd:
		motherboardHappy.visible = true
		motherboardSad.visible = false
		larryHappy.visible = true
		larrySad.visible = false
		restartButton.visible = true
		# Show Thanks for Playing scene after finishing last minigame
		if !GlobalVariables.gameComplete:
			GlobalVariables.gameComplete = true
			get_tree().change_scene("res://Scenes/MainStory/Story6.tscn")
	else:
		motherboardHappy.visible = false
		motherboardSad.visible = true
		larryHappy.visible = false
		larrySad.visible = true
		restartButton.visible = false

func _on_CPU_pressed():
	if finishedCpu:
		get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedCpu.tscn")
	else:
		get_tree().change_scene("res://Scenes/ComponentStories/CPU_Story/CPU_Story_1.tscn")

func _on_GPU_pressed():
	if finishedGpu:
		get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedGpu.tscn")
	else:
		get_tree().change_scene("res://Scenes/ComponentStories/GPU_Story/GPU_Story_1.tscn")

func _on_SSD_pressed():
	if finishedSsd:
		get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedSsd.tscn")
	else:
		get_tree().change_scene("res://Scenes/ComponentStories/SSD_Story/SSD_Story_1.tscn")

func _on_RAM_pressed():
	if finishedRam:
		get_tree().change_scene("res://Scenes/LevelEndScreens/LevelFinishedRam.tscn")
	else:
		get_tree().change_scene("res://Scenes/ComponentStories/RAM_Story/RAM_Story_1.tscn")


func _on_RestartButton_pressed():
	GlobalVariables.cpuScore = 0
	GlobalVariables.gpuScore = 0
	GlobalVariables.ramScore = 0
	GlobalVariables.ssdScore = 0
	GlobalVariables.bestCpuScore = 0
	GlobalVariables.bestGpuScore = 0
	GlobalVariables.bestRamScore = 0
	GlobalVariables.bestSsdScore = 0
	GlobalVariables.gameComplete = false
	get_tree().change_scene("res://Scenes/MainStory/Menu.tscn")
