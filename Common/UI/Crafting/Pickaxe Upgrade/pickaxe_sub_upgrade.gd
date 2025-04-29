extends VBoxContainer

@export var options:Control
@export var description: Label
@export var upgrade_button: Button

var current_option_name:String

var messages:Dictionary = {
	"head": "Allows to mine better metals",
	"binding": "Metals drop more items",
	"rod": "Speed-up mining process"
}

func _ready() -> void:
	upgrade_button.connect("pressed", Callable(self, "_on_press"))

func _process(delta: float) -> void:
	for x:CheckBox in options.get_children():
		if x.button_pressed:
			current_option_name =x.name.to_lower()
			description.text = messages.get(x.name.to_lower()) + " lvl: "+ str(Globals.pickaxe.statistics.get(current_option_name))
			

func _on_press():
	Globals.pickaxe.statistics.set(current_option_name, Globals.pickaxe.statistics.get(current_option_name)+1)
