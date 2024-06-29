extends Node2D

signal triggerFishingGame

func _on_fishing_game_button_pressed():
	triggerFishingGame.emit()


#debug stuff, remove after
func _on_rod_tp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/rodShopKeeper.tscn")


func _on_shop_tp_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/SellScreen.tscn")
