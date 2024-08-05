extends Control
@export var attributes_list: ItemList


func populate_attributes_list():
	for key in data.gui_data["attributes"].keys():
		var attribute = data.gui_data["attributes"][key]
		var idx = attributes_list.add_item(key)
		attributes_list.set_item_metadata(idx, key)
		if attribute.has("icon"):
			attributes_list.set_item_icon(idx, attribute["icon"])


# Called when the node enters the scene tree for the first time.
func _ready():
	populate_attributes_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_freaky_pressed():
	print(data.gui_data["attributes"]["name"]["dict"])


func _on_line_edit_text_changed(new_text):
	pass # Replace with function body.


func _on_item_list_item_selected(index):
	pass # Replace with function body.
