extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("shopKeeper")


func _on_sell_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_sell_menu_open_pressed():
	Dialogic.start("shopKeeper")
