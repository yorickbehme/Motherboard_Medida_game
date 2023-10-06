extends Node

var cpuScore = 0
var gpuScore = 0
var ramScore = 0
var ssdScore = 0
var bestCpuScore = 0
var bestGpuScore = 0
var bestRamScore = 0
var bestSsdScore = 0
var gameComplete = false


# functions for updating individual scores

func setCpuScore(score):
	cpuScore = score
	if score > bestCpuScore:
		bestCpuScore = score

func setGpuScore(score):
	gpuScore = score
	if score > bestGpuScore:
		bestGpuScore = score

func setRamScore(score):
	ramScore = score
	if score > bestRamScore:
		bestRamScore = score

func setSsdScore(score):
	ssdScore = score
	if score > bestSsdScore:
		bestSsdScore = score


func _ready():
	pass
