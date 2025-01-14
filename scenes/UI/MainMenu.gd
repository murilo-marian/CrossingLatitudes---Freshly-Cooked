extends Control


func _on_play_pressed():
	if $VBoxContainer/CheckBox.button_pressed:
		Global.colorblind = true
	print(Global.colorblind)
	get_tree().change_scene_to_file("res://scenes/level/Level0.tscn")
