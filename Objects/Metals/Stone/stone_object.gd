extends Metals

var item:PackedScene = load("res://Objects/Metals/Stone/StoneItem.tscn")

func _process(delta: float) -> void:
	if mouse and Globals.leftClick and !anim.is_playing():
		anim.play("Hit")
		throwItem(randi_range(1,3))
		health -= 1
	
	if health <= 0 and !anim.is_playing():
		self.queue_free()


func throwItem(number:int):
	for x in range(0,number):
		var newInstance:CharacterBody2D = item.instantiate()
		
		newInstance.position = global_position + Vector2(6,6)
		get_tree().current_scene.add_child(newInstance)
		
		var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		var speed = randf_range(100, 200)
		newInstance.velocity = direction * speed
