extends StaticBody2D
class_name object
@export var food_value = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func get_eaten():
	$CPUParticles2D.emitting = true
	$Timer.start()
	
func _on_timer_timeout():
	queue_free()
