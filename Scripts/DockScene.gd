extends Node2D

signal triggerFishingGame

func _on_fishing_game_button_pressed():
	triggerFishingGame.emit()

