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
