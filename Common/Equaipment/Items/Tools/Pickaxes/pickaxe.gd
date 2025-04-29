extends Item

class_name Pickaxe

@export var tier:int = 1

var start_value: float = 5.0
var growth_factor: float = 1.40
var jump_interval: int = 5
var jump_factor: float = 1.90

var statistics:Dictionary = {
	"head" = 1,
	"binding" = 1,
	"rod" = 1
}

func upgrade_cost(level:int):
	var num_jumps: int = level / jump_interval
	var normal_steps: int = level - num_jumps
	return start_value * pow(growth_factor, normal_steps) * pow(jump_factor, num_jumps)
