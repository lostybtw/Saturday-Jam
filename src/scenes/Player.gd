extends Sprite

export var hp = 100
export var mp = 100
export var turns = 0

var stunned = false
var skip_turn = 0
var bleed = 0

signal flamebleedhit
signal earthspikehit
signal rainfallhit
signal windsweephit
signal swordswipehit

func _process(delta):
	$HP1.text = str(hp) + " " + "HP"
	$MP1.text = str(mp) + " " + "MP"
	if hp <=0:
		get_tree().quit()
	if mp <=0:
		get_tree().quit()

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
	else:
		get_tree().quit()

func _on_flamebleed_pressed():
	attack(3,"flamebleedhit")

func _on_earthspike_pressed():
	attack(4,"earthspikehit")

func _on_rainfall_pressed():
	attack(5,"rainfallhit")

func _on_windsweep_pressed():
	attack(6,"windsweephit")

func _on_swordswipe_pressed():
	attack(7,"swordswipehit")
