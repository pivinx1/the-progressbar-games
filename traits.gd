extends Panel
@export var sel_trait_box: ItemList
@export var unsel_trait_box: ItemList
@export var add_button: Button
@export var remove_button: Button
var traits = data.things["traits"]
var trait_array: Array = traits.keys()
var unsel_trait_array: Array = traits.keys()
var unsel_trait: String
var unsel_trait_idx: int
var sel_trait: String
var sel_trait_idx: int
var member: Dictionary

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

func add_traits(select: int = -1, to: ItemList = unsel_trait_box, array: Array = trait_array, clear: bool = true):
	if clear:
		to.clear()
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
	#add_traits(-1,sel_trait_box,trait_array)

func _process(_delta):
	if data.members.has(data.selected_member):
		member = data.members[data.selected_member]
		#print(member["name"], member["traits"])
	else:
		member = {}
	if unsel_trait_box.get_selected_items().size() > 0:
		unsel_trait_idx = unsel_trait_box.get_selected_items()[0]
	else:
		unsel_trait_idx = -1
	add_traits(-1,unsel_trait_box,unsel_trait_array,true)
	if unsel_trait_idx > -1:
		unsel_trait = unsel_trait_box.get_item_metadata(unsel_trait_idx)
		unsel_trait_box.select(unsel_trait_idx)
	if data.members.has(data.selected_member):
		add_traits(-1,sel_trait_box,member["traits"])
	
	
func _on_add_trait_pressed():
	print("added trait!!")
	if (unsel_trait_idx > -1 and
	data.members.has(data.selected_member) and
	!member["traits"].has(unsel_trait)):
		data.add_trait(unsel_trait,member["name"])
