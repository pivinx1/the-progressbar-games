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

class Member:
	var member_name = ""
	var gender: Gender = Gender.OTHER
	var species: Species = Species.PERSON

class Team:
	var hated: bool = false

# Variables

var information = {
	"items" = {
		
	},
	"gear" = {
		
	},
}

var teams = {
	
}
var members = {
	
}

# Funcs

func remove_whitespace(str: String):
	var cull = RegEx.new()
	cull.compile("(\\W)+")
	return cull.sub(str,"",true)

func has_letters(str:String):
	var hletters = RegEx.new()
	hletters.compile("(\\w)+")
	if hletters.search(str(str)):
		return true
	return false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
