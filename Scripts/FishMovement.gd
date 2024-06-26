extends Node2D

var movement_speed : float = 1.25 #how long it takes for the fish to move to its next position 
#lower = faster

var min_distance = 100 #min distance traveled per move
var max_distance = 250 #max distance traveled per move

var min_position = 480 #bottom of fishing bar
var max_position =  20 #top of fishing bar
#{Common, Uncommon, Rare, Legendary, Mythic}
#fish tiered modifiers

#small will be 0.4 - 0.9x
#average will be 1x
#Large will be 1.1-2x 

var sizeMultiplier : float = 1.0
func _on_button_fish_data(rarity, size, variation): #called when player reels fish; transmtis fish data
	match rarity:
		"Common":
			movement_speed = 1
		"Uncommon":
			movement_speed = 0.75
		"Rare":
			movement_speed = 0.5
		"Legendary":
			movement_speed = 0.3
	
	match size:
		"Small":
			sizeMultiplier = randf_range(0.4, 0.9)
		"Large": 
			sizeMultiplier = randf_range(1.1, 2.0)
	
	movement_speed = movement_speed * sizeMultiplier
	print(movement_speed, rarity, size, variation)
	plan_move()
	pass # Replace with function body.

func plan_move():
	var target = randf_range(min_position, max_position)
	
	while (abs(self.position.y - target) < min_distance or abs(self.position.y - target) > max_distance):
		target = randf_range(min_position, max_position)
		
	move(Vector2(self.position.x, target))

	
func move(target):
	var tween = create_tween()
	tween.tween_property(self, "position", target, movement_speed).set_trans(Tween.TRANS_SINE)
	
	await tween.finished
	
	plan_move()

#useless funciton for now xd
func destroy():
	get_parent().remove_child(self)
	queue_free()
	

