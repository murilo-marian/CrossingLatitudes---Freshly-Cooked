extends CharacterBody2D

@onready var target = get_node(target_path) #target = who the ant is following

const SPEED = 110.0

@export var target_path : NodePath

func _ready():
	pass

func _physics_process(_delta):
	if target != null:
		var target_pos = target.global_position 
		if target != self:
			look_at(target_pos)
			if abs(global_position.distance_to(target_pos)) > 40: #stops moving if the target is too close
				velocity = global_position.direction_to(target_pos) * SPEED
			elif velocity != Vector2.ZERO:
				velocity = velocity.lerp(Vector2.ZERO, 0.07)
	move_and_slide()
