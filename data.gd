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
	# that video is so awkward lol. they don't even know that it's a furry
	UNKNOWN,
	SHEEP,
	ZOMBIE,
	GHOST,
	ABOMINATION,
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

enum GUIType {
	LINE,
	MULTILINE,
	FLOAT,
	INT,
	ENUM,
	BOOL,
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
			"items" = [],
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

# do not move this down or you will have to face ze concequences

var teams = {
	
}

var selected_team: String = "No Team"

var members = {
	
}

var selected_member: String = "ymss3000 player"

# Format explanation:
# type - check enum GUIType and how it is used in this dict
# icon - it's the icon. what more can I say
# placeholder - the placeholder for lineedits and text edits
# text - checkboxes and buttons if we ever have that gui type
# min - minimum value, for text this is characters, for numbers this is min number
# max - ditto but for maximum value
# needs_letters - runs the regex \w. checks for letters and numbers
# sub1,sub2,sub3 - dict[sub1][sub2][sub3]. if you somehow get to more subdicts than that, you can go add sub4 to the parser

# Enum format - this is for dropdowns.
# items is a dict for items to be added to the dropdown
# an item is:
# name - the name. what more do i have to say
# value - the value (metadata)
# icon - icon

## markverb1, 11:44 AM

var gui_data = {
	"attributes" = {
		"name" = {
			"type" = GUIType.LINE,
			"placeholder" = pick_random_name(member_names,{}),
			"icon" = preload("res://images/misc/nametag.png"),
			"min" = 1,
			"max" = 100,
			"needs_letters" = true,
			#"dict" = members - fuck you im hardcoding
			"sub1" = "name",
		},
		"gender" = {
			"type" = GUIType.ENUM,
			"icon" = preload("res://images/misc/gender.png"),
			"sub1" = "gender",
			"items" = {
				"male" = {
					"name" = "Male",
					"value" = Gender.MALE,
					"icon" = preload("res://images/gender/male.png")
				},
				"female" = {
					"name" = "Female",
					"value" = Gender.FEMALE,
					"icon" = preload("res://images/gender/female.png")
				},
				"other" = {
					"name" = "Other/IDK",
					"value" = Gender.OTHER,
					"icon" = preload("res://images/gender/idk.png")
				},
			},
		},
		"species" = {
			"type" = GUIType.ENUM,
			"icon" = preload("res://images/species/unknown.png"),
			"items" = {
				"person" = {
					"name" = "Person",
					"value" = Species.PERSON,
					"icon" = preload("res://images/species/person.png")
				},
				"synth" = {
					"name" = "Synth",
					"value" = Species.SYNTH,
					"icon" = preload("res://images/species/synth.png"),
					"value1" = "a",
				},
				"catperson" = {
					# sam = !catperson
					"name" = "Catperson",
					"value" = Species.CATPERSON,
					"icon" = preload("res://images/species/catperson.png")
				},
			},
		}
	},
}

# Funcs

func remove_whitespace(string: String):
	var cull = RegEx.new()
	cull.compile("(\\W)+")
	return cull.sub(string, "", true)

func pick_random_name(from: Array, add_to_dict: Dictionary = {}):
	var rand: String = from.pick_random()
	for time in range(1, 10):
		if add_to_dict.has(rand):
			rand = from.pick_random()
	return rand

func has_letters(string: String):
	var hletters = RegEx.new()
	hletters.compile("(\\w)+")
	if hletters.search(str(string)):
		return true
	return false

func resolve_dict_key_conflict(conflicting: String, dict: Dictionary):
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
func show_children_of(node):
	for child in node.get_children(false):
		child.show()
func hide_children_of(node):
	for child in node.get_children(false):
		child.hide()
<<<<<<< HEAD
=======
func set_member_attribute(member: String,sub1,sub2,sub3):
	if members.has(member):
		pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
>>>>>>> upstream/main
