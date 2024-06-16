extends Node

@export var textLabel : Label
@export var fishingRodAttached : fishingRod

signal newRod(newSpeed)
func _on_pressed():
	textLabel.text = "Fishing rod: " + fishingRodAttached.name
	newRod.emit(fishingRodAttached.hookSpeed)
	pass # Replace with function body.

