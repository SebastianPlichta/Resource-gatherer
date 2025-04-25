extends RigidBody2D

var mouse:bool

func _process(delta: float) -> void:
	if mouse:
		SignalBus.emit_signal("addItem",0)
		self.queue_free()

func _physics_process(delta: float) -> void:
	linear_velocity = lerp(linear_velocity, Vector2.ZERO, delta*10)
	
func _on_mouse_entered() -> void:
	mouse = true


func _on_mouse_exited() -> void:
	mouse = false
