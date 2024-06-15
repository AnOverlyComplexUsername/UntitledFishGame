extends Resource
class_name fishTemplate

#Cosmetic and gameplay info; rarity/size will effect strength/speed multipliers
enum variation {Golden, Holographic, None}
enum rarity {Common, Uncommon, Rare, Legendary, Mythic}
enum sizeClass {Small, Average, Large} # subdivided into different multplier ranges chosen at random; 
#will effect weight/length/sellprice/ and strength & speed 

#effets fishing gameplay
@export var fishStrength : float
@export var fishSpeed : float

#display Info after it's fished
@export var sellPrice : int 
@export var image: Texture
@export var name: String
@export var desc: String
@export var length: float
@export var weight: float

@export var minLength : float
@export var maxLength : float
@export var minWeight : float
@export var maxWeight : float

func _set_weight(w : float):
	weight = w

func _set_length(l : float):
	length = l
