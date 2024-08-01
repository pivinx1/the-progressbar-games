extends Panel

@export var text: LineEdit
@export var item_list: ItemList
@export var hated_tick: CheckBox
@export var remove_team_button: Button
@export var rename_team_button: Button

func add_team(team: String = "No Team", select_team: bool = true, uneditable: bool = false):
	if !data.has_letters(team):
		team = "No Team"
	if data.has_letters(team) and !data.teams.has(team):
		data.teams[team] = data.information["templates"]["team"].duplicate(true)
		data.teams[team]["uneditable"] = uneditable
		update_team_list()
		if select_team:
			select(team)

func remove_team(team: String):
	if data.teams.has(team):
		item_list.deselect_all()
		data.teams.erase(team)
	update_team_list()

func rename_team(team: String, to: String, select_team: bool = true):
	var dupe: Dictionary
	if data.teams.has(team) and !data.teams.has(to):
		dupe = data.teams[team].duplicate(true)
		remove_team(team)
		data.teams[to] = dupe.duplicate(true)
		update_team_list()
	if select_team:
		select(to)
	# NOTE DO NOT REMOVE THIS CODE!!!

	# markverb1 @ 11:02 PM says: this workaround creates some seemingly redundant
	# code, however it fixes a bug that i was having

func update_team_list():
	# Add new teams
	for team in data.teams.keys():
		var has_team: bool = false
		if item_list.item_count > 0:
			for item in item_list.item_count:
				if item_list.get_item_metadata(item) == team:
					has_team = true
		if !has_team:
			var idx: int = item_list.add_item(team)
			item_list.set_item_metadata(idx,team)
			
	# Remove nonexistent teams
	if item_list.item_count > 0:
		for item in item_list.item_count:
			if !data.teams.has(item_list.get_item_metadata(item)):
				item_list.remove_item(item)

func select(team: String):
	data.selected_team = team
	for item in item_list.item_count:
		if item_list.get_item_metadata(item) == data.selected_team:
			item_list.select(item,true)
	remove_team_button.disabled = data.teams[team]["uneditable"]
	rename_team_button.disabled = data.teams[team]["uneditable"]
	hated_tick.disabled = data.teams[team]["uneditable"]
	hated_tick.button_pressed = data.teams[data.selected_team]["hated"]
	

func _on_add_team_pressed():
	add_team(text.text,true)


func _on_remove_team_pressed():
	remove_team(data.selected_team)

func _on_rename_team_pressed():
	rename_team(data.selected_team,text.text,true)

func _on_hated_tick_toggled(toggled_on):
	if data.teams.has(data.selected_team):
		data.teams[data.selected_team]["hated"] = toggled_on

func _on_item_list_item_selected(index):
	select(item_list.get_item_metadata(index))

func _ready():
	add_team("No Team",true,true)
	update_team_list()

func _process(_delta):
	if item_list.get_selected_items().size() > 0:
		select(item_list.get_item_metadata(item_list.get_selected_items()[0]))
	update_team_list()
