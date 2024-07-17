extends Control

@onready var moneyLabel := $Money

# Called when the node enters the scene tree for the first time.
func _ready():
	moneyLabel.text = "$ " + str(GameManager.money) 
	GameManager.moneyChange.connect(_money_change)

func _money_change(_amount) -> void:
	moneyLabel.text = "$ " + str(GameManager.money) 

