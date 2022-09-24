extends Sprite

export var hp = 100
export var mp = 100
export var turns = 0

var stunned = false
var skip_turn = 0
var bleed = 0

signal hit

func _process(delta):
	$HP1.text = str(hp) + " " + "HP"
	$MP1.text = str(mp) + " " + "MP"
	if hp <=0:
		get_tree().quit()
	if mp <=0:
		get_tree().quit()

func _on_flamebleed_pressed():
	mp -= get_parent().get_parent().get_child(3).mp_use
	turns += 1
	if $RayCast2D.is_colliding():
		print("attack hit")
		var collider = $RayCast2D.get_collider()
		print(collider)
		if collider.is_in_group("Enemy"):
			emit_signal("hit")
