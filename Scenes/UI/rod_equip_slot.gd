extends Control

@export var iconTxt : TextureRect
@export var descLabel : Label
@export var nameLabel : Label
@export var equipButton : Button
var rodSlot : fishingRod 

func _ready():
	GameManager.updatePurchasable.connect(_update_purchasable)
	
func _update_purchasable():
	if rodSlot == GameManager.curRod:
		equipButton.text = "Equipped!"
		equipButton.disabled = true
	else:
		equipButton.text = "Equip!"
		equipButton.disabled = false
		
func updateMenu(rod : fishingRod):
	iconTxt.texture = rod.shopIcon
	descLabel.text = rod.desc
	nameLabel.text = rod.name
	print(rod.name)
	rodSlot = rod
	_update_purchasable()

func _on_equip_button_pressed():
	GameManager._update_rod(rodSlot)
	GameManager.updatePurchasable.emit()
	
