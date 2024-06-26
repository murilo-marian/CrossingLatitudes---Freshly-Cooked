extends Node2D
var follower_scene = preload("res://scenes/player/follower.tscn")
var food = 0
var running = true

func _physics_process(_delta):
	if get_node_or_null("player") != null:
		$LeafParticles.global_position = $player.global_position - Vector2(0, 500)
		
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		
	
	if $Foods.get_child_count() <= 1 and running:
		$"background music".playing = false
		$WinMusic.play()
		$UI.visible = false
		$WinUi.visible = true
		running = false
	
func _on_player_spawn_ant():
	spawn_follower()
	
func spawn_follower():
	if food >= 3:
		food -= 3
		$UI/FoodCounter.text = "Food: " + str(food)
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
	print("circle")
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

func _on_eating_area_body_entered(body): #add points for food later
	if body.has_method("get_eaten"):
		food += body.food_value
		$UI/FoodCounter.text = "Food: " + str(food)
		$Mordida.play()
		body.get_eaten()
		

func change_player():
	if $followers.get_child_count() == 0: #TODO change later to game over screen and stuff
		$player.queue_free()
		$"background music".playing = false
		$LostMusic.play()
		$player/Camera2D2.reparent($".")
		$UI.visible = false
		$LoseUi.visible = true
		$LoseModulate.visible = true
		
		return

	var first_follower = $followers.get_child(0)
	$player.global_position = first_follower.global_position
	if $followers.get_child_count() > 1:
		$followers.get_child(1).target_path = "../../player"
		$followers.get_child(1).update_target()
	first_follower.queue_free()
	
func _on_player_crumb_entered(area): 
	var layer = area.get_collision_layer()
	if layer == 4:
		food += 1
		$UI/FoodCounter.text = "Food: " + str(food)
		$Mordida.play()
		area.queue_free()
	elif layer == 32:
		area.queue_free()
		change_player()
		
func _on_ui_queen_timeout():
	$"background music".playing = false
	$LostMusic.play()
	$"background music".playing = false
	$LostMusic.play()
	$player/Camera2D2.reparent($".")
	$UI.visible = false
	$LoseUi.visible = true
	$LoseModulate.visible = true
		
