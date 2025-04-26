extends CharacterBody2D

var mouse:bool

func _process(delta: float) -> void:
	if mouse and abs(velocity) <= Vector2(0.5,0.5):
		SignalBus.emit_signal("addItem",0)
		self.queue_free()

func _physics_process(delta: float) -> void:
	velocity = lerp(velocity, Vector2.ZERO, delta * 10)
	move_and_slide()
	
	
func _on_mouse_entered() -> void:
	mouse = true


func _on_mouse_exited() -> void:
	mouse = false
