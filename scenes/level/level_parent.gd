extends Node2D
var follower_scene = preload("res://scenes/player/follower.tscn")

func _on_player_spawn_ant():
	spawn_follower()
	
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
		
func on_ant_circle(area):
	if $followers.get_child_count() > 2:
		var vertices: PackedVector2Array = PackedVector2Array()
		vertices.append($player.global_position)
		for i in $followers.get_children():
			if area.get_parent() != i:
				vertices.append(i.global_position)
			else:
				break
		$"eatingArea/CollisionPolygon2D".set_deferred("polygon", vertices)
	else:
		return

func _on_player_circle_formed(area):
	on_ant_circle(area)

func _on_eating_area_body_entered(body):
	if body.has_method("get_eaten"):
		print(body)
		body.get_eaten()
