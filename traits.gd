extends Panel

@export var selected_trait_box: VBoxContainer
@export var unselected_trait_box: VBoxContainer

func get_trait_font_color(type: data.TraitType):
	match type:
		data.TraitType.GOOD:
			return Color.GREEN
		data.TraitType.NEUTRAL:
			return Color.WHITE
		data.TraitType.NEGATIVE:
			return Color.RED
		data.TraitType.SPECIES:
			return Color.LIGHT_BLUE
		_:
			return Color.DIM_GRAY

func add_trait_buttons_type(type: data.TraitType):
	for perk in data.things["traits"]:
		if data.things["traits"][perk]["type"] == type:
			var current_perk = data.things["traits"][perk]
			var button = Button.new()
			button.name = current_perk["name"]
			button.text = current_perk["name"]
			button.icon = current_perk["icon"]
			button.add_theme_color_override("font_color",get_trait_font_color(current_perk["type"]))
			selected_trait_box.add_child(button)

func _ready():
	add_trait_buttons_type(data.TraitType.GOOD)
	add_trait_buttons_type(data.TraitType.SPECIES)
	add_trait_buttons_type(data.TraitType.NEUTRAL)
	add_trait_buttons_type(data.TraitType.NEGATIVE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
