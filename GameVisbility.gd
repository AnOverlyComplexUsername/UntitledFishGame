extends Node2D

func _ready():
	self.process_mode = Node.PROCESS_MODE_DISABLED
	self.hide()



func _on_progress_bar_caught():

	self.process_mode = Node.PROCESS_MODE_DISABLED

