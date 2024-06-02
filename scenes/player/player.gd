extends CharacterBody2D

signal spawnAnt()
signal circleFormed(area)
signal killAnt()
signal crumbEntered(area)
const SPEED = 200.0


func _physics_process(_delta):	
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	if abs(global_position.distance_to(mouse_pos)) > 30: #stops moving if the mouse is too close
		velocity = global_position.direction_to(mouse_pos) * SPEED
		$WalkParticles.emitting = true
	elif velocity != Vector2.ZERO:
		velocity = velocity.lerp(Vector2.ZERO, 0.2)
		$WalkParticles.emitting = false
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_accept"):
		spawnAnt.emit()

func _on_area_2d_area_entered(area):
	circleFormed.emit(area)

func _on_crumb_eating_area_area_entered(area):
	crumbEntered.emit(area)
