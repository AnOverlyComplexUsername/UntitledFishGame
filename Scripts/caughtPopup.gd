extends AnimationPlayer

@export var popupImage : TextureRect 

func _on_button_fish_chosen(fish : inventoryFish):
	popupImage.texture = fish.image
	print("name: " + str(fish.name))
	print("weight " + str(fish.weight))
	self.play("caughtPopup")
	
	pass # Replace with function body.

func _closePopup():
	self.play("caughtPopupClose")

func _on_animation_finished(anim_name):
	if anim_name == "caughtPopup":
		await get_tree().create_timer(0.5).timeout
		_closePopup()
