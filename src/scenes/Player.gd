extends Sprite

export var hp = 100
export var mp = 100
export var turns = 0

var stunned = false
var skip_turn = 0
var bleed = 0
var enemy_thinking = false
var attack_name = ""

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
	if enemy_thinking == false:
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
					$".".get_parent().get_parent().get_child(10).text = "Player Used " + attack_name + ", " + "Enemy Thinking"
		else:
			get_tree().quit()
	else:
		return 0

func _on_flamebleed_pressed():
	attack_name = "Flame Bleed"
	attack(3,"flamebleedhit")
	$".".get_parent().get_parent().get_child(3).get_child(4).play("Card Switch")
	$".".get_parent().get_parent().get_child(3).damage -=2
	$".".get_parent().get_parent().get_child(3).mp_use +=2

func _on_earthspike_pressed():
	attack_name = "Earth Spike"
	attack(4,"earthspikehit")
	$".".get_parent().get_parent().get_child(4).get_child(4).play("Card Switch")
	$".".get_parent().get_parent().get_child(4).damage -=2
	$".".get_parent().get_parent().get_child(4).mp_use +=2


func _on_rainfall_pressed():
	attack_name = "Rain Fall"
	attack(5,"rainfallhit")
	$".".get_parent().get_parent().get_child(5).get_child(4).play("Card Switch")
	$".".get_parent().get_parent().get_child(5).damage -=2
	$".".get_parent().get_parent().get_child(5).mp_use +=2

func _on_windsweep_pressed():
	attack_name = "Wind Sweep"
	attack(6,"windsweephit")
	$".".get_parent().get_parent().get_child(6).get_child(4).play("Card Switch")
	$".".get_parent().get_parent().get_child(6).damage -=2
	$".".get_parent().get_parent().get_child(6).mp_use +=2

func _on_swordswipe_pressed():
	attack_name = "Sword Swipe"
	attack(7,"swordswipehit")
	$".".get_parent().get_parent().get_child(7).get_child(4).play("Card Switch")
	$".".get_parent().get_parent().get_child(7).damage -=1

func damage_take(child_no):
	hp -= $".".get_parent().get_parent().get_child(child_no).damage


func _on_Enemy_enemyflamebleedhit():
	damage_take(3)
func _on_Enemy_enemyearthspikehit():
	damage_take(4)
func _on_Enemy_enemyrainfallhit():
	damage_take(5)
func _on_Enemy_enemyswordswipehit():
	damage_take(6)
func _on_Enemy_enemywindsweephit():
	damage_take(7)


func _on_Enemy_thinking():
	enemy_thinking = true

func _on_Enemy_donethinking():
	enemy_thinking = false
	yield(get_tree().create_timer(2), "timeout")
	$".".get_parent().get_parent().get_child(10).text = "                                                                     Your Turn"
