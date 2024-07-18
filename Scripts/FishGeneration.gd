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

const fishRarities = { "Common" : 1000, 
				 "Uncommon": 500,
				 "Rare" : 250,
				 "Legendary" : 50,
				 "Mythic" : 1 }

const sizeClass = { "Average": 80,
				"Small" : 15, 
				 "Large" : 10,}

#default rates: 90,20,5
const variation = {"None" : 90, 
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
	var newFish = inventoryFish.new()
	var sizeMultplier : float = 1.0
	var variMultiplier : float = 1.0
	match fishSize:
		"Small":
			sizeMultplier = randf_range(0.5,1.0)
			newFish.curSize = 0
		"Large": 
			sizeMultplier = randf_range(1.5, 2.0)
			newFish.curSize = 2
		_:
			sizeMultplier = 1.0
			newFish.curSize = 1
	newFish.sizeStr = fishSize
	
	#TODO: variation stuff TBA
	match fishVariation: 
		"Golden":
			newFish.curVari = 0
			variMultiplier = 1.5
		"Holographic":
			newFish.curVari = 1
			variMultiplier = 1.25
		_:
			newFish.curVari = 2
			variMultiplier = 1.0
	newFish.variStr = fishVariation
	
	#rarity stuff
	match fishRarity:
		"Common":
			newFish.curRarity = 0
		"Uncommon": 
			newFish.curRarity = 1
		"Rare": 
			newFish.curRarity = 2
		"Legendary":
			newFish.curRarity = 3
		"Mythic":
			newFish.curRarity = 4
		_:
			newFish.curRarity = 5


	newFish.image = chosenFish.image
	newFish.name = chosenFish.name
	newFish.desc = chosenFish.desc
	newFish.sellPrice = int(chosenFish.sellPrice * sizeMultplier * variMultiplier)
	newFish.length = snappedf(randf_range(chosenFish.minLength, chosenFish.maxLength) * sizeMultplier, 0.01)
	newFish.weight = snappedf(randf_range(chosenFish.minWeight, chosenFish.maxWeight) * sizeMultplier, 0.01)
	return newFish


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



