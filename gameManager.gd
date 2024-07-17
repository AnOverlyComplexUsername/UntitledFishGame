extends Node

#global variable for stuff :3
var fishInventory : Array[inventoryFish]
var invSizeLimit : int = 10 #by default it's 10
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
const save_dir : String = "user://Saves/"
var cur_save_file_name : String = "save.tres"

var playerData : Resource = Player_Data.new()

func save_dir_check(path : String) -> void: #creates the file
	DirAccess.make_dir_absolute(path)

func create_new_save() -> void:
	playerData = Player_Data.new()
	ResourceSaver.save(playerData, save_dir + cur_save_file_name)
	load_data(save_dir + cur_save_file_name)
	
func save_data() -> void:
	playerData.fishInventory  = fishInventory
	playerData.invSizeLimit = invSizeLimit
	playerData.rodInventory = rodInventory
	playerData.curRod = curRod
	playerData.money = money
	ResourceSaver.save(playerData, save_dir + cur_save_file_name)
	print(playerData.fishInventory)

func load_data(path : String) -> void:
	playerData = SafeResourceLoader.load(path)
	fishInventory = playerData.fishInventory
	invSizeLimit = playerData.invSizeLimit
	rodInventory = playerData.rodInventory
	curRod = playerData.curRod
	money = playerData.money
	print(fishInventory)
	
#when game runs
func _ready():
	self.fishAdded.connect(_fish_added)
	self.moneyChange.connect(_money_change)
	self.updateFishingRod.connect(_update_rod)
	self.addRodInv.connect(_add_rod)
	save_dir_check(save_dir)

func _fish_added(fish : inventoryFish) -> void:
	if fishInventory.size() < invSizeLimit:
		fishInventory.append(fish)

func _money_change(amount : int) -> void:
	money += amount

func _update_rod(rod : fishingRod) -> void:
	curRod = rod

func _add_rod(rod : fishingRod) -> void:
	rodInventory.append(rod)
