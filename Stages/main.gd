extends Node2D

@onready var sub_viewport: SubViewport = $Game/viewport/SubViewport

func _unhandled_input(event: InputEvent) -> void:
	sub_viewport.push_input(event)
