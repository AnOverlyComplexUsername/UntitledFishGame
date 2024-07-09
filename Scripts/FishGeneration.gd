extends Node

signal fishData(rarity, size, variation)

@export var commonFish : Array[fishTemplate]
@export var uncommonFish : Array[fishTemplate]
@export var fishingGame : Node2D

#current fish stuff
var fishRarity : String 
var fishSize : String
var fishVariation : String
#TODO: add a layer of RNG above this for junk/treasure/fish catch

var fishRarities = { "Common" : 1000, 
				 "Uncommon": 500,
				 "Rare" : 250,
				 "Legendary" : 50,
				 "Mythic" : 1 }

var sizeClass = { "Average": 80,
				"Small" : 15, 
				 "Large" : 10,}

#default rates: 90,20,5
var variation = {"None" : 90, 
				"Holographic" : 20,
				"Golden" : 5}

	
var rng = RandomNumberGenerator.new()

func _process_RNG(d : Dictionary ):
	rng.randomize()
	
	var weighted_sum = 0
	
	for n in d:
		weighted_sum += d[n]
	
	var ranNum = rng.randi_range(0, weighted_sum)
	
	for n in d:
		if ranNum <= d[n]:
			return(n)
		else:
			ranNum -= d[n]
	pass
	
#returns an inventoryFish based on current rarity, size, and variation
func _create_fish(fishTemplates : Array[fishTemplate]) -> inventoryFish:
	rng.randomize()
	var chosenFish = fishTemplates[rng.randi_range(0,fishTemplates.size() - 1)]
	return inventoryFish.new(chosenFish, fishSize, fishVariation, fishRarity)

func _on_fishing_game_scene_start_game():
	fishRarity = _process_RNG(fishRarities)
	fishSize = _process_RNG(sizeClass)
	fishVariation = _process_RNG(variation)
	fishData.emit(fishRarity, fishSize, fishVariation)
	fishingGame.process_mode = Node.PROCESS_MODE_INHERIT
	fishingGame.show()
	
func _on_progress_bar_caught():
	rng.randomize()
	#based on rarity, use _create_fish to randomly generate a fish from given rarity array
	match fishRarity:
		"Common":
			GameManager.fishAdded.emit(_create_fish(commonFish))
		"Uncommon":
			GameManager.fishAdded.emit(_create_fish(uncommonFish))
		#"Rare":
			#fishChosen.emit(_create_fish(rareFish))
		#"Legendary":
			#fishChosen.emit(_create_fish(legendaryFish))



