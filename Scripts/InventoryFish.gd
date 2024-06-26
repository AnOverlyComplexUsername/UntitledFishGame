class_name inventoryFish

#Cosmetic and gameplay info; rarity/size will effect strength/speed multipliers
enum variation {Golden, Holographic, None}
enum rarity {Common, Uncommon, Rare, Legendary, Mythic}
enum sizeClass {Small, Average, Large} # subdivided into different multplier ranges chosen at random; 
#will effect weight/length/sellprice/ and strength & speed 

#saves what state, used for loading shaders and inventory sort
var curVari : int
var curRarity : int
var curSize : int 

#display Info after it's fished
var sizeStr : String
var variStr : String 
var sellPrice : int 
var image: Texture
var name: String
var desc: String
var length: float
var weight: float

func _init(template : fishTemplate, s : String, v : String, r : String):
	#check for rairty and calculate out price using rarity n stuff
	#TODO: randomize price, length, and weight by size modifier and rarity
	var sizeMultplier : float = 1.0
	var variMultiplier : float = 1.0
	#size stuff
	match s:
		"Small":
			sizeMultplier = randf_range(0.5,1.0)
			curSize = sizeClass.Small
		"Large": 
			sizeMultplier = randf_range(1.5, 2.0)
			curSize = sizeClass.Large
		_:
			sizeMultplier = 1.0
			curSize = sizeClass.Average
	sizeStr = s
	#TODO: variation stuff TBA
	match v: 
		"Golden":
			curVari = variation.Golden
			variMultiplier = 1.5
		"Holographic":
			curVari = variation.Holographic
			variMultiplier = 1.25
		_:
			curVari = variation.None
			variMultiplier = 1.0
	variStr = v
	#rarity stuff
	match r:
		"Common":
			curRarity = rarity.Common
		"Uncommon": 
			curRarity = rarity.Uncommon
		"Rare": 
			curRarity = rarity.Rare
		"Legendary":
			curRarity = rarity.Legendary
		"Mythic":
			curRarity = rarity.Mythic
		_:
			curRarity = rarity.Common
			
	image = template.image
	name = template.name
	desc = template.desc
	sellPrice = int(template.sellPrice * sizeMultplier * variMultiplier)
	length = snappedf(randf_range(template.minLength, template.maxLength) * sizeMultplier, 0.01)
	weight = snappedf(randf_range(template.minWeight, template.maxWeight) * sizeMultplier, 0.01)

