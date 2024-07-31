extends Panel

@export var item_list: ItemList
@export var line_edit: LineEdit
@export var rm_button: Button
var selected_member: String = ""
var updating = true
var amount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_member_list()

func add_member(member: String, team: String):
	data.members[member] = data.information["templates"]["member"].duplicate()
	data.members[member]["team"] = team

func remove_member(member: String):
	updating = false
	for item in item_list.item_count:
		if item_list.item_count > item and item_list.get_item_metadata(item) == member:
			item_list.select(item-1,true)
	data.members.erase(member)
	updating = true

func update_member_list():
	if updating:
		# Add new members
		for member in data.members.keys():
			# checks if the member exists
			var has_member: bool = false
			#var current_member = data.members[member]
			if item_list.item_count > 0:
				for item in item_list.item_count:
					if item < item_list.item_count:
						if item_list.get_item_metadata(item) == member:
							has_member = true
						if data.selected_team != data.members[member]["team"]:
							has_member = true
			if !has_member:
				# actually adds the member
				var idx: int = item_list.add_item(member)
				item_list.set_item_metadata(idx,member)
				
		# Remove nonexistent members
		if item_list.item_count > 0:
			for item in item_list.item_count:
				if item < item_list.item_count:
					var member = item_list.get_item_metadata(item)
					if !data.members.has(member) or data.members[member]["team"] != data.selected_team:
						item_list.remove_item(item)

func _on_add_member_pressed():
	# i guess this is somewhat readable? still don't like it
	if amount > 0:
		for i in range(0,amount):
			add_member(
				data.resolve_dict_key_conflict(
					data.pick_random_name(
						data.member_names,
						data.members),
					data.members),
				data.selected_team
				)

func _on_remove_member_pressed():
	remove_member(selected_member)

# NOTE TO CONTRIBUTORS: this is deliberately done with a signal.
func _on_line_edit_text_changed(new_text):
	var regex = RegEx.new()
	regex.compile("(^0-9\\W)+")
	amount = clamp(int(regex.sub(new_text,"",true)),0,100)
	if int(line_edit.text) != amount:
		line_edit.text = str(amount)

func _on_danger_tick_toggled(toggled_on):
	rm_button.disabled = !toggled_on

func _on_item_list_item_selected(index):
	selected_member = item_list.get_item_metadata(index)
