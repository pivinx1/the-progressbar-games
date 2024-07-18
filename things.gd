extends Node

var token: String

# Enums

enum SpeciesType {
	HUMAN,
	CATPERSON,
	FURRY,
	PROTOGEN,
	SHEEP,
	ZOMBIE,
	GHOST,
}

enum Gender {
	MALE,
	FEMALE,
	OTHER
}

enum TraitType {
	GOOD,
	NEUTRAL,
	NEGATIVE,
	SPECIES,
}
enum ItemType {
	FIREARM,
	MELEE,
	MAGICAL,
	FOOD,
	MEDICAL,
}
enum GearType {
	EYES,
	SKIN,
	LEGS,
	HAT,
	SHIRT,
	PANTS,
	HELMET,
	VEST,
	LEG_ARMOR
}
enum GuiType {
	BOOL,
	LINEEDIT,
	DROPDOWN,
}


# Funcs

var names = [
		"Mark", "Processes", "Theta", "Makarov", "Gordon Freeman", "Proto", "The Fake BarOS 15",
		"Max Design Pro", "Sphere", "Shirley", "markverb1 was here :3",
		"Joe Mama", "Jane Mama", "FreezingGlaci3r", "Seafork", "tickedadjective0",
		"Block Alt", "Kotek", "John Link (FAKE)", "L0v3r", "delete me = no family",
		"Galvanized Square Steel", "Eco-Friendly Wood Veneer", "Soft Padding",
		"Screws From Aunt", "urstandingonmydick", "Crazy Segment",
		"Pomni from the Boring Digital School",  "Skibidi Biden", "Joe Joe Joe"
		
]

func resolve_name_conflict(conflicting:String,dict:Dictionary):
	var attempts: int = 0
	var conflicting_temp: String = conflicting
	if dict.has(conflicting_temp):
		attempts = 1
	while dict.has(conflicting_temp):
		attempts += 1
		conflicting_temp = conflicting + str(attempts)
	match attempts:
		0:
			return conflicting
		_:
			return conflicting + str(attempts)
	#return conflicting + str(attempts)

func get_random_name():
	return names[randi_range(0,names.size()-1)]

func has_letters(your_string: String):
	var regex = RegEx.new()
	var trim_whitespace = RegEx.new()
	trim_whitespace.compile("(\\W)+")
	regex.compile("[a-zA-Z0-9]+")
	if trim_whitespace.sub(your_string,"",true) == ("markverb"):
		return false
	return regex.search(str(your_string))

func add_trait(perk: String,member: String):
	if members.has(member):
		if things["traits"].has(perk):
			members[member]["traits"].append(perk)

# Config File

var config = ConfigFile.new()
var path = "./saves/config.ini"
func _ready():
	var err = config.load(path)
	if err != OK:
		for section in things["config_file"].keys():
			for key in things["config_file"][section]:
				config.set_value(section,key,things["config_file"][section][key])
		config.save(path)
	
# Item Definitons

var things = {
	"config_file" = {
		"Misc" = {
			"token": "",
		}
	},
	"member" = {
		"name" = "markverb1 was here :3",
		"team" = "No Team",
		"gender" = Gender.OTHER,
		"species" = SpeciesType.HUMAN,
		"hated" = false,
		"avatar" = "",
		"traits" = ["lucky"],
		"items" = [],
		"gear" = [],
		"stats" = {
			# Weapon Handling
			"firearms" = 0.0,
			"melee" = 0.0,
			
			# Physical
			"vitality" = 0.0,
			"strength" = 0.0,
			"cuteness" = 0.0,
			
			# Mental
			"intelligence" = 0.0,
			"pacifism" = 0.0,
			"happiness" = 0.0,
			"kindness" = 0.0,
			"suicidal" = 0.0,
			"devious" = 0.0,
			
			# Practical
			"luck" = 0.0,
			"inventor" = 0.0,
			"medical" = 0.0,
		},
	},
	"team" = {
		"hated" = false,
	},
	"traits" = {
		"sociopath" = {
			"name" = "Sociopath",
			"description" = "Will kill, lie and act recklessly.",
			"points" = 6,
			"type" = TraitType.NEGATIVE,
			"icon" = preload ("res://images/physchopath.png"),
			"effects" = {
				"suicidal" = 2.5,
				"devious" = 10,
				"kindness" = -7.5,
				"happiness" = -2,
				"luck" = -1,
			}
		},
		"lucky" = {
			"name" = "Lucky",
			"description" = "Finds more loot.",
			"points" = 4,
			"type" = TraitType.GOOD,
			"effects" = {"luck" = 5},
			"icon" = preload ("res://images/lucky.png"),
		},
		"cute" = {
			"name" = "Cute",
			"description" = "People will like you more.",
			"points" = 4,
			"type" = TraitType.GOOD,
			"effects" = {"cuteness" = 5},
			"icon" = preload ("res://images/cute.png"),
		},
		"catperson" = {
			"name" = "Catperson",
			"description" = "Kind, cute, but bad at fighting.",
			"points" = 4,
			"type" = TraitType.SPECIES,
			"icon" = preload ("res://images/catperson.png"),
			"effects" = {
				"cuteness" = 5,
				"pacifism" = 2.5,
				"kindness" = 5,
				"firearms" = -5,
				"melee" = -5,
				"medical" = 2.5,
			},
		},
		
	},
	"lists" = {
		"basic_info" = {
			"name" = {
				"type" = GuiType.LINEEDIT,
				"placeholder" = "Name",
			},
			"gender" = {
				"type" = GuiType.DROPDOWN,
				"items" = {
					"male" = {
						"text" = "Male",
						"icon" = preload("res://images/male.png"),
						"meta" = Gender.MALE
					},
					"female" = {
						"text" = "Female",
						"icon" = preload("res://images/female.png"),
						"meta" = Gender.FEMALE
					},
					"other" = {
						"text" = "Other/IDK",
						"icon" = preload("res://images/idk.png"),
						"meta" = Gender.OTHER
					},
				},
			},
		},

	}
};

# markverb1 says: probably not a very good idea to store every single global
# variable in one file, but whatever

# Variables

var teams = {
	
}

var members = {
	
}

var selected_team: String
var selected_member: String
