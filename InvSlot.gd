extends Panel

@onready var itemIcon : Sprite2D = $itemIcon
var filled := false


func updateItem(fish : inventoryFish):
	if !filled:
		itemIcon.visible = true
		itemIcon.texture = fish.image
		filled = true
