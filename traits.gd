extends Panel
@export var selected_trait_box: ItemList
@export var unsel_trait_box: ItemList
@export var add_button: Button
@export var remove_button: Button
var traits = data.things["traits"]

func add_unsel_traits(select: int = 0):
	add_unselected_trait_buttons_type(data.TraitType.GOOD)
	add_unselected_trait_buttons_type(data.TraitType.SPECIES,true)
	add_unselected_trait_buttons_type(data.TraitType.NEUTRAL)
	add_unselected_trait_buttons_type(data.TraitType.NEGATIVE)
	unsel_trait_box.select(select)

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

func add_unselected_trait_buttons_type(type: data.TraitType, disabled: bool = false):
	for perk in traits:
		if traits[perk]["type"] == type:
			var current_perk = traits[perk]
			var idx = unsel_trait_box.add_item(current_perk["name"],current_perk["icon"])
			unsel_trait_box.set_item_metadata(idx,perk)
			unsel_trait_box.set_item_custom_fg_color(idx,get_trait_font_color(current_perk["type"]))
			unsel_trait_box.set_item_disabled(idx,disabled)
			unsel_trait_box.set_item_tooltip(idx,current_perk["description"])

func _ready():
	add_unsel_traits()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var tosel = 0
	if unsel_trait_box.get_selected_items().size() > 0:
		tosel = unsel_trait_box.get_selected_items()[0]
	unsel_trait_box.clear()
	add_unsel_traits(tosel)
