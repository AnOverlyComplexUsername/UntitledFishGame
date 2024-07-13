extends Node

#global variable for stuff :3
var fishInventory : Array[inventoryFish]
var invSizeLimit : int = 10
var rodInventory :  Array[fishingRod]
var curRod : fishingRod #default rod as failsafe

var money : int = 0 

#fishing 
signal fishAdded(fish: inventoryFish)
signal selectedFish(fish: inventoryFish, slot)

#buying/selling
signal updatePurchasable
signal moneyChange(amount : int )

#fishing rod
signal updateFishingRod(rod : fishingRod)
signal addRodInv(rod : fishingRod)

#save/load data here
func save_data():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")

func load_data():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

#when game runs
func _ready():
	self.fishAdded.connect(_fish_added)
	self.moneyChange.connect(_money_change)
	self.updateFishingRod.connect(_update_rod)
	self.addRodInv.connect(_add_rod)
	
func _fish_added(fish):
	if fishInventory.size() < invSizeLimit:
		fishInventory.append(fish)

func _money_change(amount : int):
	money += amount 

func _update_rod(rod : fishingRod):
	curRod = rod

func _add_rod(rod : fishingRod):
	rodInventory.append(rod)
