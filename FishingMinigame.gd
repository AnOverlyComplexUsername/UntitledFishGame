extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.process_mode = Node.PROCESS_MODE_DISABLED
	self.hide()
	pass # Replace with function body.


func _on_progress_bar_caught():
	#TODO: add game fishing game process here 
	self.process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.
