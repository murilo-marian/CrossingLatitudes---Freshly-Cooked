extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level1.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/UI/Options_Menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
