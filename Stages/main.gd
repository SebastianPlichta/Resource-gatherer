extends Node2D

@onready var sub_viewport: SubViewport = $Game/viewport/SubViewport

func _unhandled_input(event: InputEvent) -> void:
	sub_viewport.push_input(event)


func _on_button_pressed() -> void:
	if Globals.items[0] >= 5:
		Globals.items[0] -= 5
		SignalBus.emit_signal("addItem", 2)
