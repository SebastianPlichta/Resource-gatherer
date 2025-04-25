extends Node

var leftClick:bool
var items:Array = [0]

@onready var eq: Label

func _ready() -> void:
	SignalBus.connect("addItem", Callable(self, "_addItem"))

func _process(delta: float) -> void:
	
	leftClick = Input.is_action_just_pressed("left_click")
	if eq != null:
		eq.text = "Stones: " + str(items[0])
	else:
		eq = get_tree().get_first_node_in_group("EQ")

func _addItem(id:int):
	if items.size() < id:
		return
		
	items[id] += 1
