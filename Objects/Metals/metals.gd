extends Area2D

class_name Metals

@onready var anim: AnimationPlayer = $Anim

@export var id:int
@export var health:int = 3

var mouse:bool = false

func _ready() -> void:
	self.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	self.connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	
func _on_mouse_entered() -> void:
	mouse = true

func _on_mouse_exited() -> void:
	mouse = false
