extends Resource

class_name fishingRod

#shop stuff
@export var shopIcon : Texture
@export var name : String
@export var desc: String
@export var price : int

#gameplay stuff
@export var hookStrength: float #acts as a multplier for hook speed via hookStrength - fishStrength
@export var hookSpeed : int #how fast the progress bar increments
@export var hookVerticalSpeed : int #how fast the fishing rod goes up and down 
