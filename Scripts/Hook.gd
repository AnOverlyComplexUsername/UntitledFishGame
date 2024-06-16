extends CharacterBody2D

signal catching(speed);

@export var speed : int = 100; #speed of the hook rising when holding/clicking m1
@export var gravity: float = 500; #how fast the hook falls when not held
@export var fallSpeed: float = 2

var acceleration : float = 2; #how fast the hook accelerates when button is being held
var catchingSpeed : float = 0.25 #how fast the fishing progress bar fills (will change baseed on fishing rod equiped)

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position.y += -speed * delta * acceleration
		velocity.y = 0
	else:
		#acceleration = clamp((acceleration - 0.25) * delta, 1, 9999);
		velocity.y += delta * gravity 
	move_and_slide()

func _on_area_2d_caught():
	catching.emit(catchingSpeed)



func _on_button_2_new_rod(newSpeed):
	speed = newSpeed
	pass # Replace with function body.


func _on_button_3_new_rod(newSpeed):
	speed = newSpeed
	pass # Replace with function body.
