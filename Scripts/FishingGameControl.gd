extends Node2D

var fishInventory : Array[inventoryFish]
var invSizeLimit := 10
@export var fishingRodInventory : Array[fishingRod]

signal fishAdded(fish : inventoryFish)
# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	self.process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.

func _on_fish_generation_fish_chosen(fish):
	if fishInventory.size() < invSizeLimit:
		fishAdded.emit(fish)
		
		
func _on_dock_scene_trigger_fishing_game():
	self.show()
	self.process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.

func _on_popup_animation_animation_finished(anim_name):
	if anim_name == "caughtPopupClose":
		self.hide()
		self.process_mode = Node.PROCESS_MODE_DISABLED
