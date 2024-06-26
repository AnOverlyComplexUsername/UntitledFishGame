extends ProgressBar

signal caught()

@export var decaySpeed : float = 2

func _ready():
	value = 0.0

func _process(delta):
	if(value >= 100):
		caught.emit()
	value += -decaySpeed * delta

func _on_hook_catching(speed):
	value += speed; #everytime progress bar recieves on_hook_catching; increment number by the speed of the hook

func _on_caught():
	value = 0

