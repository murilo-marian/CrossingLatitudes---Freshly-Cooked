extends Node

@onready var timer = $"../TimerLabel/TimerCounter"

# Called when the node enters the scene tree for the first time.
func _ready():
	$angry.stop()
	$"../TimerLabel".modulate = Color.DARK_GREEN
	$happy.visible = true
	$happy.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if int(timer.time_left) <= 70 and int(timer.time_left) > 45:
		$happy.stop()
		$happy.visible = false
		$"../TimerLabel".modulate = Color.YELLOW
		
		$uneasy.visible = true
		$uneasy.play()
	elif timer.time_left <= 45 and int(timer.time_left) > 10:
		$uneasy.stop()
		$uneasy.visible = false
		$"../TimerLabel".modulate = Color.DARK_ORANGE
		
		$bothered.visible = true
		$bothered.play()
	elif int(timer.time_left) <= 10:
		$bothered.stop()
		$bothered.visible = false
		$"../TimerLabel".modulate = Color.DARK_RED
		
		$angry.visible = true
		$angry.play()
