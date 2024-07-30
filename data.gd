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
	"sphere5590", "Xedomonaxx", "theta.ua", "Vehicle Slave", "Bath Unfunny",
]

 #_____       _                                    
#/  __ \     | |                                   
#| /  \/ __ _| |_ __ _ _ __ ___   __ _ _ __  _ __  
#| |    / _` | __/ _` | '_ ` _ \ / _` | '_ \| '_ \ 
#| \__/\ (_| | || (_| | | | | | | (_| | |_) | |_) |
 #\____/\__,_|\__\__,_|_| |_| |_|\__,_| .__/| .__/ 
									 #| |   | |    
									 #|_|   |_|    
# i know you're reading this.
# why are you here if you are banned from contributing...

var information = {
	"items" = {
		
	},
	"gear" = {
		
	},
	"templates" = {
		"team" = {
			"hated" = false,
			"uneditable" = false,
		},
		"member" = {
			"name" = "",
			"team" = "",
			"gender" = Gender.OTHER,
			"species" = Species.PERSON,
			"traits" = [],
			"gear" = {
				"head" = "",
				"skin" = "",
				"legs" = "",
				"hat" = "",
				"shirt" = "",
				"pants" = "",
				"helmet" = "",
				"vest" = "",
				"leg_protection" = ""
			},
			"variables" = {
				"hp" = 20,
				"armor" = 0,
				"shell_shock" = 0,
				
			},
			"stats" = {
				# Weapon Handling
				"firearms" = 0,
				"melee" = 0,
				# Mental
				"intelligence" = 0,
				"perception" = 0,
				"agility" = 0,
				# Emotions and relationships
				"stability" = 0,
				"annoyance" = 0,
				"naivity" = 0,
				"suicidal" = 0,
				# Physical
				"strength" = 0,
				"vitality" = 0,
				"stress_resistance" = 0,
				# Practical
				"medical" = 0,
				"enginnering" = 0,
				"leadership" = 0,
				"programming" = 0, # to get out of this hellhole
			},
		},
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

func pick_random_name(from: Array, add_to_dict: Dictionary = {}):
	var rand: String = from.pick_random()
	for time in range(1,10):
		if add_to_dict.has(rand):
			rand = from.pick_random()
	return rand

func has_letters(string:String):
	var hletters = RegEx.new()
	hletters.compile("(\\w)+")
	if hletters.search(str(string)):
		return true
	return false

func resolve_dict_key_conflict(conflicting:String,dict:Dictionary):
	var attempts: int = 0
	#var conflicting_temp: String = conflicting
	if dict.has(conflicting):
		attempts = 1
	while dict.has(conflicting + str(attempts)):
		attempts += 1
	match attempts:
		0:
			return conflicting
		_:
			return conflicting + str(attempts)
	#return conflicting + str(attempts)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
