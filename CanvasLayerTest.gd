extends CanvasLayer

@export var fishInventory : Array[fishTemplate]
@export var fishingRodInventory : Array[fishingRod]

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	self.process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.

func _on_button_fish_data(rarity, size, variation):
	pass # Replace with function body.

func _on_fishing_scene_game_activated():
	self.show()
	self.process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.
