extends Node2D

signal triggerFishingGame

#contains all code for menu and other functionality within the scene

func _on_fishing_game_button_pressed():
	triggerFishingGame.emit()
	pass # Replace with function body.
