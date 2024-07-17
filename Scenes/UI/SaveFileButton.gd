extends Button

@export var fileNum : int = 1
var save_file_name : String
var hasFile : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	save_file_name = GameManager.save_dir +  "save" + str(fileNum) + ".tres" 
	if (FileAccess.file_exists(save_file_name)):
		self.text = "File Detected!!"
		hasFile = true
	else: 
		self.text = "No File Found"


func _on_pressed():
	GameManager.cur_save_file_name = "save" + str(fileNum) + ".tres" 
	if (hasFile):
		GameManager.load_data(save_file_name)
	else:
		GameManager.create_new_save()
	
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
