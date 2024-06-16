extends Button

signal fishData(rarity, size, variation)

@export var commonFish : Array[fishTemplate]
@export var uncommonFish : Array 
@export var fishingGame : Node2D

#TODO: add a layer of RNG above this for junk/treasure/fish catch

var fishRarities = { "Common" : 1000, 
				 "Uncommon": 500,
				 "Rare" : 250,
				 "Legendary" : 50,
				 "Mythic" : 1 }

var sizeClass = { "Average": 80,
				"Small" : 15, 
				 "Large" : 10,}


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

func _on_pressed():
	fishData.emit(_process_RNG(fishRarities), _process_RNG(sizeClass), _process_RNG(variation) )
	fishingGame.process_mode = Node.PROCESS_MODE_INHERIT
	fishingGame.show()



func _on_progress_bar_caught():
	fishData.emit(_process_RNG(fishRarities), _process_RNG(sizeClass), _process_RNG(variation) )
	pass # Replace with function body.
