extends Node

var fishInventory : Array[inventoryFish]
var invSizeLimit := 10
@export var fishingRodInventory : Array[fishingRod]

signal gameActivated
signal fishAdded(fish : inventoryFish)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_fishing_game_button_pressed():
	gameActivated.emit()
	pass # Replace with function body.


func _on_fish_generation_fish_chosen(fish):
	if fishInventory.size() < invSizeLimit:
		fishAdded.emit(fish)
		
	pass # Replace with function body.
