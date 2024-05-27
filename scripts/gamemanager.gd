extends Node

var score = 0

@onready var coin_counter = $"../CanvasLayer/Coin counter"


func add_point():
	score += 1
	coin_counter.text = "Coins: " + str(score)
