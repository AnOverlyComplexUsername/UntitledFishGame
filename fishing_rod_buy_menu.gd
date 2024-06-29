extends Control


func _ready():
	self.visible = false

func _on_button_pressed():
	self.visible = !self.visible
	GameManager.updatePurchasable.emit()

#remove after debug.
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

