extends Panel

@export var item_list: ItemList
@export var line_edit: LineEdit
@export var rm_button: Button
var amount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_member_list()

func add_member(member: String):
	data.members[member] = data.information["templates"]["member"].duplicate()
	

func update_member_list():
	# Add new memberss
	for members in data.members.keys():
		var has_members: bool = false
		if item_list.item_count > 0:
			for item in item_list.item_count:
				if item_list.get_item_metadata(item) == members:
					has_members = true
		if !has_members:
			var idx: int = item_list.add_item(members)
			item_list.set_item_metadata(idx,members)
			
	# Remove nonexistent memberss
	if item_list.item_count > 0:
		#print(item_list.item_count)
		for item in item_list.item_count:
			if !data.members.has(item_list.get_item_metadata(item)):
				item_list.remove_item(item)

func _on_add_member_pressed():
	# i guess this is somewhat readable? still don't like it
	if amount > 0:
		for i in range(1,amount):
			add_member(
				data.resolve_dict_key_conflict(
					data.pick_random_name(
						data.member_names,
						data.members),
					data.members)
				)

func _on_remove_member_pressed():
	pass # Replace with function body.

# NOTE TO CONTRIBUTORS: this is deliberately done with a signal.
func _on_line_edit_text_changed(new_text):
	var regex = RegEx.new()
	regex.compile("(^0-9\\W)+")
	amount = clamp(int(regex.sub(new_text,"",true)),0,100)
	if int(line_edit.text) != amount:
		line_edit.text = str(amount)

func _on_danger_tick_toggled(toggled_on):
	rm_button.disabled = !toggled_on
