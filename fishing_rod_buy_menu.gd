extends Control

func _ready():
	self.visible = false
	Dialogic.signal_event.connect(_dialogic_signal_event)
	
func _on_button_pressed():
	Dialogic.start("rodShop")

#remove after debug.
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _dialogic_signal_event(argument : String):
	if argument == "_open_shop":
		self.visible = !self.visible
		GameManager.updatePurchasable.emit()



func _on_close_button_pressed():
	self.visible = !self.visible
