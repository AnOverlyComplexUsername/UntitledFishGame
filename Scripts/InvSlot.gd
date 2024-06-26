extends Panel

@onready var itemIcon : Sprite2D = $itemIcon
@onready var selectColor := $ColorRect

var currentItem : inventoryFish

signal currentItemData(fish : inventoryFish)

func _ready():
	itemIcon.visible = false

func updateItem(fish : inventoryFish):
	if !currentItem:
		itemIcon.visible = true
		itemIcon.texture = fish.image
		currentItem = fish

func _toggle_select():
	selectColor.visible = !selectColor.visible

func _on_texture_button_pressed():
	if currentItem:
		GameManager.selectedFish.emit(currentItem, self)
