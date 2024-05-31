extends Node2D
var follower_scene = preload("res://scenes/player/follower.tscn")

func spawn_follower():
	var follower = follower_scene.instantiate() as CharacterBody2D
	$followers.call_deferred("add_child", follower)
	
	if not $followers.get_children().is_empty():
		var last_follower: CharacterBody2D = $followers.get_children().back()
		follower.target_path = last_follower.get_path()
		follower.global_position = last_follower.global_position
	else:
		follower.target_path = "../../player"
		follower.global_position = $player.global_position
	
func _on_player_spawn_ant():
	spawn_follower()
