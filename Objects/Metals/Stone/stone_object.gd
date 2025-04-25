extends Area2D

@onready var anim: AnimationPlayer = $Anim

var mouse:bool
var item:PackedScene = load("res://Objects/Metals/Stone/StoneItem.tscn")

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if mouse and Globals.leftClick and !anim.is_playing():
		anim.play("Hit")
		throwItem(randi_range(1,3))
	
func _on_mouse_entered() -> void:
	mouse = true

func _on_mouse_exited() -> void:
	mouse = false

func throwItem(number:int):
	for x in range(0,number):
		var newInstance:RigidBody2D = item.instantiate()
		
		newInstance.position = global_position
		get_tree().current_scene.add_child(newInstance)
		
		var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		var speed = randf_range(100, 200)
		newInstance.linear_velocity = direction * speed
