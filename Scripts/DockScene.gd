extends Node2D

@export var bobTxt : TextureRect
@export var bobAni : AnimationMixer
@export var timer : Timer
@export var fishingBtn : TextureButton
@export var fishingAlert : TextureRect
signal triggerFishingGame
var bobbingNum : int = 0
var delayTime : float = 0.5 #time before the first opportunity a fish can bite
var minVal : float = snappedf(10/3.0, 0.01) #min val 10 s total / 3 bobs
var maxVal : float = 10 #max val 30 s total / 3 bobs
var maxBobs = 2 #normally 3
var casted = false

func _on_fishing_game_button_pressed():
	if GameManager.invSizeLimit > GameManager.fishInventory.size() and casted == false:
		bobTxt.modulate = Color(255,255,255,255)
		bobTxt.show() 
		fishingBtn.show()
		bobbingNum = 0
		casted = true
		timer.start(_set_new_intrvl())

func _set_new_intrvl():
	return snappedf(randf_range(minVal,maxVal), 0.01)
	
#debug stuff, remove after
func _on_rod_tp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/rodShopKeeper.tscn")

func _on_shop_tp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/SellScreen.tscn")


func _on_timer_timeout(): #when timer between animations goes off 
	if bobbingNum < maxBobs:
		bobAni.play("bobbing")
		bobbingNum += 1
		timer.start(_set_new_intrvl())
	if bobbingNum >= maxBobs: #TODO: add a check to see if player clicks after 3 bites or before
		if !casted:
			fishingAlert.hide()
			bobTxt.hide()
			fishingBtn.hide()
			timer.stop()
			bobbingNum = 0
		else:
			fishingAlert.show()
			timer.start(5)
			casted = false
	print("cur bobbings " + str(bobbingNum))

func _on_texture_button_2_pressed(): #clicking function
	if bobbingNum < maxBobs: 
		print("stopped fishing")
		pass
	elif bobbingNum >= maxBobs:
		triggerFishingGame.emit()
		print("reeling in!")
	
	timer.stop()
	fishingAlert.hide()
	fishingBtn.hide()
	casted = false
	bobTxt.hide()


func _on_save_button_pressed():
	GameManager.save_data()


func _on_save_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
