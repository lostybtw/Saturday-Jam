extends Sprite

export var hp = 100
export var mp = 100
export var turns = 0

var stunned = false
var skip_turn = 0
var bleed = 0
var just_hit = false
var sigsend = ""

signal enemyflamebleedhit
signal enemyearthspikehit
signal enemyrainfallhit
signal enemywindsweephit
signal enemyswordswipehit

func _process(delta):
	$HP2.text = str(hp) + " " + "HP"
	$MP2.text = str(mp) + " " + "MP"
	if hp <=0:
		get_tree().quit()
	if mp <=0:
		get_tree().quit()
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	rand = (rand.randi_range(3, 7))
	backattack(rand)
	just_hit = false

func damage_take(child_no):
	hp -= $".".get_parent().get_parent().get_child(child_no).damage

func attack(child_no):
	if mp >= get_parent().get_parent().get_child(child_no).mp_use:
		mp -= get_parent().get_parent().get_child(child_no).mp_use
		mp += get_parent().get_parent().get_child(child_no).mp_gain
		turns += 1
		if $RayCast2D.is_colliding():
			print("attack hit")
			var collider = $RayCast2D.get_collider()
			print(collider)
			if collider.is_in_group("Enemy"):
				emit_signal(sigsend)

func _on_Player_flamebleedhit():
	damage_take(3)
	just_hit = true


func _on_Player_earthspikehit():
	damage_take(4)
	just_hit = true

func _on_Player_rainfallhit():
	damage_take(5)
	just_hit = true


func _on_Player_windsweephit():
	damage_take(6)
	just_hit = true


func _on_Player_swordswipehit():
	damage_take(7)
	just_hit = true

func backattack(rand):
	if just_hit:
		print(rand)
		if rand == 3:
			sigsend = "enemyflamebleedhit"
		elif rand == 4:
			sigsend = "enemyearthspikehit"
		elif rand == 5:
			sigsend = "enemyrainfallhit"
		elif rand == 6:
			sigsend = "enemywindsweephit"
		elif rand == 7:
			sigsend = "enemyswordswipehit"
		attack(rand)
