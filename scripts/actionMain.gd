extends Panel

# Instantiation of stuff
var ex = Expression.new()

# Constants
const diceFloor: int = 1

# Exports
@export var logField: RichTextLabel	 # using camelCase so I don't get RSI or something

func _ready():
	randomize()		# prepare the dice


func rollDice(d: int):	# generic roll
	return randf_range(diceFloor, d)	# "dice" roll for generic actions

func modifierDiceRoll(d: int, skill: String):	# used for ability checks
	# var modifier: int = calculateModifier(skills[skill])
	var rollResult: int = rollDice(d)
	# return rollResult + modifier

func calculateModifier(skillLevel: int):
	ex.parse("(x - 10) / 2", ["x"])
	return ex.execute([skillLevel])
