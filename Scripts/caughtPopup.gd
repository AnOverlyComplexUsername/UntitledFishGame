extends AnimationPlayer

@export var popupImage : TextureRect 

func _ready():
	GameManager.fishAdded.connect(_fish_added)

func _fish_added(fish: inventoryFish):
	popupImage.texture = fish.image
	self.play("caughtPopup")
	pass
	
func _closePopup():
	self.play("caughtPopupClose")

func _on_animation_finished(anim_name):
	if anim_name == "caughtPopup":
		await get_tree().create_timer(0.5).timeout
		_closePopup()
