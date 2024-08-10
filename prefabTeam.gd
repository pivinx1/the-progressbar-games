var teams = {
	"BLUFOR" = {
		"hated" = false,
		"uneditable" = false,
		},
    "OPFOR" = {
        "hated" = true,
        "uneditable" = false,
    }    
}

var members = {
		"Niko" = {
			"name" = "Niko",
			"team" = "BLUFOR",
			"gender" = Gender.MALE,
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
				"firearms" = 9,
				"melee" = 5,
				# Mental
				"intelligence" = 6,
				"perception" = 8,
				"agility" = 7,
				# Emotions and relationships
				"stability" = 3,
				"annoyance" = 6,
				"naivity" = 0,
				"suicidal" = 0,
				# Physical
				"strength" = 6,
				"vitality" = 8,
				"stress_resistance" = 7,
				# Practical
				"medical" = 4,
				"enginnering" = 2,
				"leadership" = 5,
				"programming" = 1, # to get out of this hellhole
			},
		},
        "dogagpss" = {
			"name" = "dogagpss",
			"team" = "OPFOR",
			"gender" = Gender.MALE,
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
				"firearms" = 4,
				"melee" = 3,
				# Mental
				"intelligence" = 5,
				"perception" = 3,
				"agility" = 4,
				# Emotions and relationships
				"stability" = 5,
				"annoyance" = 2,
				"naivity" = 3,
				"suicidal" = 0,
				# Physical
				"strength" = 3,
				"vitality" = 3,
				"stress_resistance" = 1,
				# Practical
				"medical" = 1,
				"enginnering" = 1,
				"leadership" = 1,
				"programming" = 2, # to get out of this hellhole
			},
		},
}

