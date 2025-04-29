extends Node

var leftClick:bool
var items:Array = [0,0,1]

var pickaxe = Pickaxe.new()

@onready var eq: Label
@onready var eq_2: Label

@onready var eqs:Array

var eqsText:Array = ["Stone: ", "Iron: "]

func _ready() -> void:
	SignalBus.connect("addItem", Callable(self, "_addItem"))
	eq = get_tree().current_scene.get_node("EQ")
	eq_2 = get_tree().current_scene.get_node("EQ2")
	eqs = [eq,eq_2]
	
func _process(delta: float) -> void:
	
	leftClick = Input.is_action_just_pressed("left_click")
	for x in range(0,eqs.size()):
		eqs[x].text = eqsText[x] + str(items[x])

func _addItem(id:int):
	if items.size() < id:
		return
		
	items[id] += 1
