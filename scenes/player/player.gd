extends CharacterBody2D

signal spawnAnt()
const SPEED = 110.0


func _physics_process(_delta):	
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	if abs(global_position.distance_to(mouse_pos)) > 30: #stops moving if the mouse is too close
		velocity = global_position.direction_to(mouse_pos) * SPEED
	elif velocity != Vector2.ZERO:
		velocity = velocity.lerp(Vector2.ZERO, 0.07)
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_accept"):
		spawnAnt.emit()
