extends CanvasLayer

@export var fishInventory : Array[fishTemplate]
@export var fishingRodInventory : Array[fishingRod]

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	self.process_mode = Node.PROCESS_MODE_DISABLED

func _on_fishing_scene_game_activated():
	self.show()
	self.process_mode = Node.PROCESS_MODE_INHERIT

func _on_popup_animation_animation_finished(anim_name):
	if anim_name == "caughtPopupClose":
		self.hide()
		self.process_mode = Node.PROCESS_MODE_DISABLED
