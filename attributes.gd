extends Control
@export var item_list: ItemList
@export var control: Control



func populate_item_list():
	for key in data.gui_data["attributes"].keys():
		var attribute = data.gui_data["attributes"][key]
		var idx = item_list.add_item(key)
		item_list.set_item_metadata(idx, key)
		if attribute.has("icon"):
			item_list.set_item_icon(idx, attribute["icon"])

func _on_item_list_item_selected(index):
	var attr_name: String = item_list.get_item_metadata(index)
	var attribute: Dictionary = data.gui_data["attributes"][attr_name]
	var type: data.GUIType = attribute["type"]
	data.hide_children_of(control)
	match type:
		data.GUIType.BOOL:
			print("BOOLEAN")
		data.GUIType.LINE:
			print("Line")

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_item_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_freaky_pressed():
	print(data.gui_data["attributes"]["name"]["dict"])


# OH MY GODOT SHIT UP
@warning_ignore("unused_parameter")
func _on_line_edit_text_changed(new_text):
	pass # Replace with function body.
