extends Resource
class_name inventoryFish

#Cosmetic and gameplay info; rarity/size will effect strength/speed multipliers
#enum variation {Golden, Holographic, None} 
#enum rarity {Common, Uncommon, Rare, Legendary, Mythic} 
#enum sizeClass { Small, Average, Large}  # subdivided into different multplier ranges chosen at random; 
#will effect weight/length/sellprice/ and strength & speed 

#saves what state, used for loading shaders and inventory sort
@export var curVari : int
@export var curRarity : int
@export var curSize : int 

#display Info after it's fished
@export var sizeStr : String
@export var variStr : String 
@export var sellPrice : int 
@export var image: Texture
@export var name: String
@export var desc: String
@export var length: float
@export var weight: float

#func _init(template : fishTemplate, s : String, v : String, r : String):
	##check for rairty and calculate out price using rarity n stuff
	##TODO: randomize price, length, and weight by size modifier and rarity
	#var sizeMultplier : float = 1.0
	#var variMultiplier : float = 1.0
	##size stuff
	#match s:
		#"Small":
			#sizeMultplier = randf_range(0.5,1.0)
			#curSize = 0
		#"Large": 
			#sizeMultplier = randf_range(1.5, 2.0)
			#curSize = 2
		#_:
			#sizeMultplier = 1.0
			#curSize = 1
	#sizeStr = s
	##TODO: variation stuff TBA
	#match v: 
		#"Golden":
			#curVari = 0
			#variMultiplier = 1.5
		#"Holographic":
			#curVari = 1
			#variMultiplier = 1.25
		#_:
			#curVari = 2
			#variMultiplier = 1.0
	#variStr = v
	##rarity stuff
	#match r:
		#"Common":
			#curRarity = 0
		#"Uncommon": 
			#curRarity = 1
		#"Rare": 
			#curRarity = 2
		#"Legendary":
			#curRarity = 3
		#"Mythic":
			#curRarity = 4
		#_:
			#curRarity = 5
			#
	#image = template.image
	#name = template.name
	#desc = template.desc
	#sellPrice = int(template.sellPrice * sizeMultplier * variMultiplier)
	#length = snappedf(randf_range(template.minLength, template.maxLength) * sizeMultplier, 0.01)
	#weight = snappedf(randf_range(template.minWeight, template.maxWeight) * sizeMultplier, 0.01)
#
