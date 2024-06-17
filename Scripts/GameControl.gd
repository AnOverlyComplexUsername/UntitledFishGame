extends Node

@export var fishInventory : Array[fishTemplate]
@export var fishingRodInventory : Array[fishingRod]

signal gameActivated

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_button_fish_data(rarity, size, variation):
	
	pass # Replace with function body.



func _on_fishing_game_button_pressed():
	gameActivated.emit()
	pass # Replace with function body.
