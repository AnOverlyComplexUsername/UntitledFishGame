extends Node2D

func _ready():
	self.hide()
	self.process_mode = Node.PROCESS_MODE_DISABLED

func _on_dock_scene_trigger_fishing_game():
	self.show()
	self.process_mode = Node.PROCESS_MODE_INHERIT


func _on_popup_animation_animation_finished(anim_name):
	if anim_name == "caughtPopupClose":
		self.hide()
		self.process_mode = Node.PROCESS_MODE_DISABLED
