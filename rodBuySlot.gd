extends Panel

@export var purchasableRod : fishingRod
@onready var rodIcon : TextureRect = $rodIcon
@onready var rodName : Label = $nameLabel
@onready var rodDesc : Label = $descLabel
@onready var rodStr : Label = $strLabel
@onready var rodSpd : Label= $spdLabel
@onready var purchaseButton := $purchaseButton
var purchased : bool = false

func _ready():
	GameManager.updatePurchasable.connect(_update_purchasable)
	if purchasableRod: #if rod isn't null then load values
		purchaseButton.text = "$ " + str(purchasableRod.price)
		rodName.text = purchasableRod.name
		rodDesc.text = purchasableRod.desc
		rodStr.text = "Rod Strength: " + str(purchasableRod.hookStrength)
		rodSpd.text = "Rod Speed : " + str(purchasableRod.hookSpeed)
		rodIcon.texture = purchasableRod.shopIcon
		
		if purchasableRod in GameManager.rodInventory:
			purchased = true #checks if rod is already purchased

func _update_purchasable(): #updates button state 
	if purchased:
		if GameManager.curRod != purchasableRod: 
			purchaseButton.text = "Equip"
		else:
			purchaseButton.text = "Equipped"

	elif purchasableRod and GameManager.money >= purchasableRod.price:
		purchaseButton.disabled = false
	else:
		purchaseButton.disabled = true


func _on_button_pressed(): #player can only press button AFTER having enough funds already 
	if purchased and GameManager.curRod != purchasableRod:
		print("equipped! " + purchasableRod.name)
		GameManager.updateFishingRod.emit(purchasableRod) 
	else: 
		GameManager.moneyChange.emit(-purchasableRod.price)
		purchased = true
		GameManager.addRodInv.emit(purchasableRod)
	GameManager.updatePurchasable.emit()
