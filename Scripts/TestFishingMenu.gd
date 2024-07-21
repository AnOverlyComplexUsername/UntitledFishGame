extends Control

@onready var rodEquipSlot := preload("res://Scenes/UI/rod_equip_slot.tscn")

func _ready():
	self.hide()
	for i in range(GameManager.rodInventory.size()):
		get_node("ScrollContainer/VBoxContainer").add_child(rodEquipSlot.instantiate())
		$ScrollContainer/VBoxContainer.get_child(i).updateMenu(GameManager.rodInventory[i])
		

func _on_out_of_bounds_pressed():
	self.hide()

func _on_texture_button_pressed():
	self.show()
