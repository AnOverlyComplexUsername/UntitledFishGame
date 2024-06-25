extends Control

@onready var invSlots : Array = $Panel/NinePatchRect/GridContainer.get_children()


func _ready():	
	self.hide()


func _process(_delta):
	if Input.is_action_just_pressed("inv_open"): #closes and opens inv UI
		if self.visible:
			self.hide()
		else: 
			self.show()

func _add_item(fish : inventoryFish):
	for i in range(invSlots.size()):
		if not invSlots[i].filled:
			invSlots[i].updateItem(fish)
			break

func _on_fishing_game_fish_added(fish):
	_add_item(fish)
	pass # Replace with function body.
