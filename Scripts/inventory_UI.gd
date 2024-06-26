extends Control

@onready var invSlots : Array = $Panel/NinePatchRect/GridContainer.get_children()
#selected details 
@onready var displayInfoPanel := $Panel/DisplayPanel
@export var displayIcon : TextureRect
@export var displayName : Label
@export var displayDesc : Label
@export var displayCost : Label

var selectedSlot 

func _ready():	
	GameManager.fishAdded.connect(_fish_added)
	GameManager.selectedFish.connect(_selected_fish)
	displayInfoPanel.hide()
	self.hide()


func _process(_delta):
	if Input.is_action_just_pressed("inv_open"): #closes and opens inv UI
		self.visible = !self.visible

func _add_item(fish : inventoryFish):
	for i in range(invSlots.size()):
		if  !invSlots[i].currentItem:
			invSlots[i].updateItem(fish)
			break

func _fish_added(fish : inventoryFish):
	_add_item(fish)
	pass # Replace with function body.

func _selected_fish(fish : inventoryFish, slot):
	if selectedSlot:
		selectedSlot._toggle_select()
		selectedSlot = slot
		selectedSlot._toggle_select()
	else:
		selectedSlot = slot
		selectedSlot._toggle_select()
	
	#resets and determins extra labels for fish
	displayName.text = ""


	if fish.curVari != 2:
		displayName.text += fish.variStr + " "
	if fish.curSize != 1:
		displayName.text += fish.sizeStr + " "
	displayName.text += fish.name
	
	displayInfoPanel.show()
	displayIcon.texture = fish.image
	displayDesc.text = fish.desc
	displayCost.text = "$ " + str(fish.sellPrice)
