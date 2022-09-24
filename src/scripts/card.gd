extends Button

export var damage = 0
export var bleed = 0
export var mp_use = 0
export var mp_gain = 0
export var stun = false
export var bleed_type = ""
export var damage_reduction = 0
export var mp_use_increase = 0
export var card_size_reduction = 0
export var card_name = "world"
export (Texture) var card_image

func _ready():
	$CardSprite.texture = card_image
	$name.text = card_name
	$MP.text = str(mp_use) + " " + "MP"
	$DP.text = str(damage) + " " + "DP"


