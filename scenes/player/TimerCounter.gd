extends Timer

const MAX_WAITING_TIME = 120

func _get_minutes_and_seconds():
	var minutes:int = floor(time_left/60)
	var seconds:int = int(time_left)%60
	
	return [minutes, seconds]

# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = MAX_WAITING_TIME
	start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
