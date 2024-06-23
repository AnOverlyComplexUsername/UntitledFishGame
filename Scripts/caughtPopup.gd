extends AnimationPlayer

@export var popupImage : TextureRect 

func _on_button_fish_chosen(fish : inventoryFish):
	popupImage.texture = fish.image
	print("name: " + str(fish.name))
	print("weight " + str(fish.weight))
	self.play("caughtPopup")
	pass # Replace with function body.
