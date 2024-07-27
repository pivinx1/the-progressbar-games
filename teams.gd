extends Panel

var update: bool = true
@export var text: LineEdit
@export var item_list: ItemList

func add_team(team: String = "No Team", select_team: bool = true):
	if !data.has_letters(team):
		team = "No Team"
	if data.has_letters(team) and !data.teams.has(team):
		data.teams[team] = data.information["templates"]["team"].duplicate(true)
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
	

func update_team_list():
	if update:
		# Add new teams
		for team in data.teams.keys():
			var has_team: bool = false
			if item_list.item_count > 0:
				for item in item_list.item_count:
					if item_list.get_item_metadata(item) == team:
						has_team = true
			#print(has_team)
			if !has_team:
				var idx: int = item_list.add_item(team)
				item_list.set_item_metadata(idx,team)
				
		# Remove nonexistent teams
		if item_list.item_count > 0:
			print(item_list.item_count)
			for item in item_list.item_count:
				if !data.teams.has(item_list.get_item_metadata(item)):
					item_list.remove_item(item)

func select(team: String):
	data.selected_team = team
	for item in item_list.item_count:
		#print(item_list.get_item_metadata(item))
		if item_list.get_item_metadata(item) == data.selected_team:
			item_list.select(item,true)
			#print(item)

func _on_add_team_pressed():
	add_team(text.text,true)


func _on_remove_team_pressed():
	remove_team(data.selected_team)


func _on_rename_team_pressed():
	rename_team(data.selected_team,text.text,true)


@warning_ignore("unused_parameter")
func _on_hated_tick_toggled(toggled_on):
	pass # Replace with function body.

func _on_item_list_item_selected(index):
	select(item_list.get_item_metadata(index))
	#data.selected_team = item_list.get_item_metadata(index)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_team("No Team",true)
	update_team_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#update_team_list()
	pass






