extends Metals

func _process(delta: float) -> void:
	if mouse and Globals.leftClick and !anim.is_playing() and Globals.items[2] >= 5:
		anim.play("Hit")
		for x in range(0, Globals.items[2]):
			throwItem()
			health -= 1
			if health <= 0:
				destroy()
				return
	
