extends Node
#global variable for stuff :3
var fishInventory : Array[inventoryFish]
var invSizeLimit := 10

signal fishAdded(fish: inventoryFish)
signal selectedFish(fish: inventoryFish, slot)

func _ready():
	self.fishAdded.connect(_fish_added)

func _fish_added(fish):
	if fishInventory.size() < invSizeLimit:
		fishInventory.append(fish)

