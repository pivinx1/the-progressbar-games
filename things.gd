extends Node

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
	HAT,
	SHIRT,
	PANTS,
}
var things = {
	"member" = {
		"name" = "markverb1",
		"gender" = Gender.OTHER,
		"species" = SpeciesType.HUMAN,
		"hated" = false,
		"avatar" = "",
		"traits" = [],
		"items" = [],
		"gear" = [],
		"stats" = {
			"firearms" = 0.0,
			"melee" = 0.0,
			"health" = 0.0,
			"strength" = 0.0,
			"luck" = 0.0,
			"cuteness" = 0.0,
			"intelligence" = 0.0,
			"pacifism" = 0.0,
			"kindness" = 0.0,
			"happiness" = 0.0,
			"suicidal" = 0.0,
			"inventor" = 0.0,
			"devious" = 0.0,
			"medical" = 0.0
		},
	},
	"team" = {
		"name" = "Nil And Void",
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
};
var teams = {
	
}
var members = {
	
}
