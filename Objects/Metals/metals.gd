extends Area2D

class_name Metals

@onready var anim: AnimationPlayer = $Anim

@export var id:MetalsId

var health:int
var mouse:bool = false

func _ready() -> void:
	self.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	self.connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	health = id.health

func destroy():
	self.queue_free()
		
func throwItem():
	var number = randi_range(id.quanityMin,id.quanityMax)
	for x in range(0,number):
		var newInstance:CharacterBody2D = id.item.instantiate()
		
		newInstance.position = global_position + Vector2(6,6)
		get_tree().current_scene.add_child(newInstance)
		
		var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		var speed = randf_range(100, 200)
		newInstance.velocity = direction * speed

func _on_mouse_entered() -> void:
	mouse = true

func _on_mouse_exited() -> void:
	mouse = false
