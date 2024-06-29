extends Button



func _on_pressed():
	GameManager.moneyChange.emit(100)
