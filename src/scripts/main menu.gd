extends Control



func _on_play_pressed():
	get_tree().change_scene("res://src/scenes/Test.tscn")


func _on_about_pressed():
	get_tree().change_scene("res://src/scenes/about.tscn")


func _on_quit_pressed():
	get_tree().quit()
