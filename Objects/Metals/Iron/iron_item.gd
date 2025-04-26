extends MetalsCollectable

func _process(delta: float) -> void:
	if mouse and abs(velocity) <= Vector2(0.5,0.5):
		SignalBus.emit_signal("addItem",1)
		self.queue_free()
