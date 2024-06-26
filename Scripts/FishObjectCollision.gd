extends Area2D

@export var hookObject : CharacterBody2D;

var fishStrength : float;
signal caught;


func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if hookObject != null and overlaps_body(hookObject):
		caught.emit() #when player objec tis inside fish's hitbox then emits caught signal to hook


