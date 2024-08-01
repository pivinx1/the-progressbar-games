extends Control
@export var attributes_list: ItemList


func populate_attributes_list():
	for key in data.gui_data["attributes"].keys():
		var attribute = data.gui_data["attributes"][key]
		var idx = attributes_list.add_item(key)
		if attribute.has("icon"):
			attributes_list.set_item_icon(idx,attribute["icon"])

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_attributes_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
