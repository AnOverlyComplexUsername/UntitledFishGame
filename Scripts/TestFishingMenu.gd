extends Control

func _ready():
	self.hide()

func _on_texture_button_pressed():
	self.show()

func _on_out_of_bounds_pressed():
	self.hide()

