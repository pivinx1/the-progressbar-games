extends Panel

var text: String = ""
var selected: String = "No Team"
var update: bool = true
@export var item_list: ItemList

func add_team(team: String = "No Team", select_team: bool = true):
	if !data.has_letters(team):
		team = "No Team"
	if data.has_letters(team) and !data.teams.has(team):
		update = false
		data.teams[team] = data.information["templates"]["team"].duplicate(true)
		if select_team:
			select(name)
	update = true

func remove_team(team: String):
	if data.teams.has(team):
		update = false
		item_list.deselect_all()
		data.teams.erase(team)
	update = true

func rename_team(team: String, to: String, select_team: bool = true):
	if data.teams.has(team) and !data.teams.has(to):
		update = false
		data.teams[to] = data.teams[team].duplicate(true)
		remove_team(team)
	update = true
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
			for item in item_list.item_count:
				if !data.teams.has(item_list.get_item_metadata(item)):
					item_list.remove_item(item)

func select(team: String):
	selected = team
	for item in item_list.item_count:
		if item_list.get_item_metadata(item) == selected:
			item_list.select(item,true)

func _on_add_team_pressed():
	add_team(text,true)


func _on_remove_team_pressed():
	remove_team(selected)


func _on_rename_team_pressed():
	rename_team(selected,text,true)


@warning_ignore("unused_parameter")
func _on_hated_tick_toggled(toggled_on):
	pass # Replace with function body.


func _on_text_text_changed(new_text):
	text = new_text

func _on_item_list_item_selected(index):
	selected = item_list.get_item_metadata(index)

# Called when the node enters the scene tree for the first time.
func _ready():
	update_team_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_team_list()






