extends Resource
class_name Player_Data

@export var playerName : String 
@export var invSizeLimit : int = 10 #by default it's 10
@export var rodInventory :  Array[fishingRod]
@export var curRod : fishingRod #default rod as failsafe
@export var money : int = 0
@export var fishInventory : Array[inventoryFish]
