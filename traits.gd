extends Panel
@export var selected_trait_box: ItemList
@export var unsel_trait_box: ItemList
@export var add_button: Button
@export var remove_button: Button
var traits = data.things["traits"]
var trait_array = traits.keys()
var unsel_trait_array = []
var sel_un_trait: String
var sel_un_trait_idx: int
var sel_sl_trait: String
var sel_sl_trait_idx: int

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

func add_traits(select: int = -1, to: ItemList = unsel_trait_box, array: Array = trait_array):
	add_traits_to_list(data.TraitType.GOOD,to,array)
	add_traits_to_list(data.TraitType.SPECIES,to,array,true)
	add_traits_to_list(data.TraitType.NEUTRAL,to,array)
	add_traits_to_list(data.TraitType.NEGATIVE,to,array)
	if select >= 0:
		to.select(select)

func add_traits_to_list(type: data.TraitType, list: ItemList, array: Array, disabled: bool = false):
	for perk in array:
		if traits[perk]["type"] == type:
			var current_perk = traits[perk]
			var idx = list.add_item(current_perk["name"],current_perk["icon"])
			list.set_item_metadata(idx,perk)
			list.set_item_custom_fg_color(idx,get_trait_font_color(current_perk["type"]))
			list.set_item_disabled(idx,disabled)
			list.set_item_tooltip(idx,current_perk["description"])

func _ready():
	add_traits(-1,unsel_trait_box,trait_array)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# I HATE THIS CODE SO MUCH AAAAAAAAAAAAAAAAAAAAAAAAAAAaaa
	sel_un_trait_idx = 0
	if unsel_trait_box.get_selected_items().size() > 0:
		sel_un_trait_idx = unsel_trait_box.get_selected_items()[0]
	else:
		sel_un_trait_idx = -1
	unsel_trait_array.clear()
	for i in unsel_trait_box.get_item_count():
		unsel_trait_array.append(unsel_trait_box.get_item_metadata(i))
	unsel_trait_box.clear()
	add_traits(sel_un_trait_idx,unsel_trait_box,unsel_trait_array)

