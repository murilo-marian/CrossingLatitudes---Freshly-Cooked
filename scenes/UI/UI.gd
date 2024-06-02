extends CanvasLayer
signal queen_timeout()

func _on_timer_counter_timeout():
	queen_timeout.emit()
