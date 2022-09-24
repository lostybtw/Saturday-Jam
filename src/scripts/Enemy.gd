extends Sprite

export var hp = 100
export var mp = 100
export var turns = 0

var stunned = false
var skip_turn = 0
var bleed = 0

func _process(delta):
	$HP2.text = str(hp) + " " + "HP"
	$MP2.text = str(mp) + " " + "MP"
	if hp <=0:
		get_tree().quit()
	if mp <=0:
		get_tree().quit()

func _on_flamebleed_pressed():
	mp = mp - get_parent().get_child(3).mp_use


func _on_Player_hit():
	hp -= $".".get_parent().get_parent().get_child(3).damage
