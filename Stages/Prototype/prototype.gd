extends Node2D

@onready var sub_viewport: SubViewport = $Game/viewport/SubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	sub_viewport.push_input(event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if Globals.items[0] >= 5:
		Globals.items[0] -= 5
		SignalBus.emit_signal("addItem", 2)
