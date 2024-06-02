extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	self_modulate = Color.WEB_GRAY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "%02d:%02d" % $TimerCounter._get_minutes_and_seconds()
