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
# Called when the node enters the scene tree for the first time.
func _ready():
	for perk in data.things["traits"]:
		var current_perk = data.things["traits"][perk]
		var button = Button.new()
		button.name = current_perk["name"]
		button.text = current_perk["name"]
		button.icon = current_perk["icon"]
		button.add_theme_color_override("font_color",get_trait_font_color(current_perk["type"]))
		selected_trait_box.add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
