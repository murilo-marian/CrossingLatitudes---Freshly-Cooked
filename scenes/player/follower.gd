extends CharacterBody2D

@onready var target = get_node(target_path) #target = who the ant is following
@export var target_path : NodePath
const SPEED = 200.0

func _ready():
	pass

func _physics_process(_delta):
	if target != null:
		var target_pos = target.global_position 
		if target != self:
			look_at(target_pos)
			if abs(global_position.distance_to(target_pos)) > 40: #stops moving if the target is too close
				velocity = global_position.direction_to(target_pos) * SPEED
				$WalkParticles.emitting = true
			elif velocity != Vector2.ZERO:
				velocity = velocity.lerp(Vector2.ZERO, 0.2)
				$WalkParticles.emitting = false
	move_and_slide()
	
func update_target():
	target = get_node(target_path)
