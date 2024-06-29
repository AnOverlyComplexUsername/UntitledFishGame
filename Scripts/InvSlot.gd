extends Panel

@onready var itemIcon : Sprite2D = $itemIcon
@onready var selectColor := $ColorRect

var currentItem : inventoryFish

signal currentItemData(fish : inventoryFish)

func _ready():
	itemIcon.visible = false

#called in inv_UI script to load in fish
func updateItem(fish : inventoryFish):
	if fish == null: #checks if fish being passed is null
		itemIcon.visible = false
		print("item sold!")
	elif !currentItem: #checks if there's no current item
		itemIcon.visible = true
		itemIcon.texture = fish.image
	currentItem = fish

func _toggle_select():
	selectColor.visible = !selectColor.visible

func _on_texture_button_pressed():
	if currentItem:
		GameManager.selectedFish.emit(currentItem, self)
