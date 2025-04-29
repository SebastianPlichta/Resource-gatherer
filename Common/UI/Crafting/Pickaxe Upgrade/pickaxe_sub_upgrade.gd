extends VBoxContainer

@export var options:Control
@export var description: Label
@export var upgrade_button: Button
@export var upgrade_costs: Label
var button_group:ButtonGroup
var option_name:String
var cost:int

var messages:Dictionary = {
	"head": "Allows to mine better metals",
	"binding": "Metals drop more items",
	"rod": "Speed-up mining process"
}

func _ready() -> void:
	upgrade_button.connect("pressed", Callable(self, "_on_press"))
	button_group = options.get_children()[0].button_group
	for x in button_group.get_buttons():
		x.connect("pressed", Callable(self, "options_update"))
	options_update()
	
func _process(delta: float) -> void:
	pass

func options_update():
	for x in button_group.get_buttons():
		if x.button_pressed:
			option_name = x.name.to_lower()
			var level =Globals.pickaxe.statistics.get(option_name)
			description.text = messages.get(option_name) + " lvl: "+ str(level)
			cost = Globals.pickaxe.upgrade_cost(level)
			upgrade_costs.text = "Costs - Stones: "+ str(cost)
			
func _on_press():
	if cost <= Globals.items[0]:
		Globals.items[0] -= cost 
		Globals.pickaxe.statistics.set(option_name, Globals.pickaxe.statistics.get(option_name)+1)
		options_update()
