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
	if mp >= get_parent().get_child(3).mp_use:
		mp = mp - get_parent().get_child(3).mp_use

func damage_take(child_no):
	hp -= $".".get_parent().get_parent().get_child(child_no).damage

func attack(child_no,signaltosend):
	if mp >= get_parent().get_parent().get_child(child_no).mp_use:
		mp -= get_parent().get_parent().get_child(child_no).mp_use
		mp += get_parent().get_parent().get_child(child_no).mp_gain
		turns += 1
		if $RayCast2D.is_colliding():
			print("attack hit")
			var collider = $RayCast2D.get_collider()
			print(collider)
			if collider.is_in_group("Enemy"):
				emit_signal(signaltosend)

func _on_Player_flamebleedhit():
	damage_take(3)


func _on_Player_earthspikehit():
	damage_take(4)

func _on_Player_rainfallhit():
	damage_take(5)


func _on_Player_windsweephit():
	damage_take(6)


func _on_Player_swordswipehit():
	damage_take(7)

