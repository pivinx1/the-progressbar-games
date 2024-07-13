extends Node

enum TraitType {
	GOOD,
	NEUTRAL,
	NEGATIVE,
}
enum ItemType {
	FIREARM,
	MELEE,
	MAGICAL,
	FOOD,
	MEDICAL,
}
enum GearType {
	STANDARD,
	POWERED,
	COSMETIC,
}
var things = {
	"member" = {
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
		},
	},
	"traits" = {
		"lucky" = {
			"name" = "Lucky",
			"description" = "Finds more loot.",
			"points" = 4,
			"type" = TraitType.GOOD,
			"effects" = {
				"luck" = 5
			},
		},
	},
};
