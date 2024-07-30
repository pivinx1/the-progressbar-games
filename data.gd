extends Control
# Enums

enum TraitType {
	POSITIVE,
	NEUTRAL,
	SPECIES,
	NEGATIVE
}

enum Gender {
	MALE,
	FEMALE,
	OTHER
}

enum Species {
	PERSON,
	SYNTH,
	CATPERSON,
	FURRY,
	PROTOGEN, # It's the motherfucker from fortnite (fortnite)
	UNKNOWN,
	SHEEP,
	ZOMBIE,
	GHOST
}

enum GearType {
	# Body
	HEAD,
	SKIN,
	LEGS,
	# Cosmetic
	HAT,
	SHIRT,
	PANTS,
	# Armor
	HELMET,
	VEST,
	LEG_PROTECTION,
}

# Classes

# Variables

var member_names = [
	"Joe Mama", "Jane Mama", "DogaGPSS", "FreezingGlaci3r", "FuwwyAI",
	"ProtoGuy", "Guy", "NotGuy", "CatGuy", "ComputerGuy", "pomni from the boring analog school",
	"markverb1 was here :3", "Bitwise Labs", "Maika Ti V Legloto", "george the Idot",
	"skywolf", "PianBad69", "m*ve on", "Uplink Gateway", "Hugh Jazz", "Mike Rafone",
	"Ben Dover", "Mike Hawk", "markverb1 try to write a good sample name (impossible)",
	"the skibidi rizzler", "ZalezGaming2", "LOE-", "John Lee-nk", "Michael from Michael Zombies",
	"A certain spoiled brat that talks like a lawyer (spoiler: he's called leuko)",
	"TayLay", "ivan dolvich", "that woman from uplink", "Bit", "Lithium",
	"Fricks", "Stinkbug", "Moyta Mahala", "Mule", "mariverb1", "Setup", "h8ther's mom",
	"L0ver", "the cops that came to undo your mom :p", "lmao dude", "uncute sam",
	"sphere5590", "Xedomonaxx", "theta.ua", "Vehicle Slave", "Bath Unfunny"
]

var information = {
	"items" = {
		
	},
	"gear" = {
		
	},
	"templates" = {
		"team" = {
			"hated" = false,
			"uneditable" = false,
		}
	}
}

var teams = {
	
}
var selected_team: String = "No Team"

var members = {
	
}

# Funcs

func remove_whitespace(string: String):
	var cull = RegEx.new()
	cull.compile("(\\W)+")
	return cull.sub(string,"",true)

func has_letters(string:String):
	var hletters = RegEx.new()
	hletters.compile("(\\w)+")
	if hletters.search(str(string)):
		return true
	return false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
