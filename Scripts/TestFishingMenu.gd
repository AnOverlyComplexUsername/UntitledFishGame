extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


func _on_texture_button_pressed():
	self.show()

func _on_out_of_bounds_pressed():
	self.hide()

