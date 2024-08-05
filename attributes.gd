extends Control

var freaky: bool = false
@export var freaky_button: Button

@export var item_list: ItemList
@export var control: Control

@export var checkbox: CheckBox
@export var lineedit: LineEdit
@export var textedit: TextEdit
@export var spinbox: SpinBox
@export var dropdown: OptionButton # i refuse to call it an ""option button""

# I FUCKING HATE THIS AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA


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
			checkbox.show()
			checkbox.text = "On"
		data.GUIType.LINE:
			lineedit.show()
			if attribute.has("placeholder"):
				lineedit.placeholder_text = attribute["placeholder"]
			if attr_name == "name":
				lineedit.placeholder_text = data.pick_random_name(data.member_names)
			
			

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_item_list()
	data.hide_children_of(control)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_freaky_pressed():
	if not freaky:
		print("freaky mode active 👅💦🧏‍♂️🤫")
		freaky_button.hide()
		freaky = true


# OH MY GODOT SHIT UP
@warning_ignore("unused_parameter")
func _on_line_edit_text_changed(new_text):
	if lineedit.visible:
		print("im visible u can do thr thing now")
