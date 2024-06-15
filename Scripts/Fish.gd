extends Node2D


var movement_speed = 1.25 #how long it takes for the fish to move to its next position

var min_distance = 150 #min distance traveled per move
var max_distance = 300 #max distance traveled per move

var min_position = 64 #bottom of fishing bar
var max_position = 500 #top of fishing bar

func _ready():
	plan_move()
	
func plan_move():
	var target = randf_range(min_position, max_position)
	
	while (abs(self.position.y - target) < min_distance or abs(self.position.y - target) > max_distance):
		target = randf_range(min_position, max_position)
		
	move(Vector2(self.position.x, target))

	
func move(target):
	var tween = create_tween()
	tween.tween_property(self, "position", target, movement_speed).set_trans(Tween.TRANS_SINE)
	
	await tween.finished
	
	timeout();

func destroy():
	get_parent().remove_child(self)
	queue_free()
	
func timeout():
	plan_move()
