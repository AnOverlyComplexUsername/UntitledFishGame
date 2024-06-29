extends Control
#all slots
@onready var invSlots : Array = $Panel/NinePatchRect/GridContainer.get_children()

#selected details 
@onready var displayInfoPanel := $Panel/DisplayPanel
@onready var sellButton := $Panel/DisplayPanel/SellButton
@export var displayIcon : TextureRect
@export var displayName : Label
@export var displayDesc : Label
@export var displayCost : Label

var selectedSlot #stores data on which slot is currently selected

func _ready():	
	GameManager.fishAdded.connect(_fish_added)
	GameManager.selectedFish.connect(_selected_fish)
	displayInfoPanel.hide()
	sellButton.hide()
	for fish in GameManager.fishInventory:
		_add_item(fish)
	self.hide()

func _process(_delta):
	if Input.is_action_just_pressed("inv_open"): #closes and opens inv UI
		self.visible = !self.visible
		sellButton.hide()
		displayDesc.show()

#inv is reloaded by setting all slots to null and then readding every item
func _reload_inv():
	for i in range(invSlots.size()):
		invSlots[i].itemIcon.texture = null
		invSlots[i].currentItem = null
	for fish in GameManager.fishInventory:
		_add_item(fish)

func _add_item(fish : inventoryFish):
	for i in range(invSlots.size()):
		if !invSlots[i].currentItem: #if the slot has no item (null)
			invSlots[i].updateItem(fish)
			break

func _fish_added(fish : inventoryFish): #called externally when a fish is added
	_add_item(fish)

func _selected_fish(fish : inventoryFish, slot):
	if selectedSlot:
		selectedSlot._toggle_select() #detoggles slot highlight
		selectedSlot = slot
		selectedSlot._toggle_select() #toggles new slot highlight
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

func _on_sell_button_pressed():
	if selectedSlot:
		GameManager.moneyChange.emit(selectedSlot.currentItem.sellPrice)
		displayInfoPanel.hide()
		GameManager.fishInventory[GameManager.fishInventory.find(selectedSlot.currentItem)] = null
		selectedSlot.updateItem(null)
		selectedSlot._toggle_select()
		selectedSlot = null
		_reload_inv() #reloads inventory when things are sold so items move back
		

func _on_sell_menu_open_pressed():
	self.visible = !self.visible
	sellButton.show()
	displayDesc.hide()
