extends Panel
var teams = data.teams
@export var team_text_box: LineEdit
@export var remove_button: Button
@export var rename_button: Button
@export var team_box: ItemList
@export var team_hated_box: CheckBox
signal team_button_pressed(team: String)
signal team_removed(team:String)

func _on_item_list_item_selected(index):
	data.selected_team = team_box.get_item_text(team_box.get_selected_items()[0])
	team_button_pressed.emit(team_box.get_item_text(index))
	team_hated_box.button_pressed = teams[team_box.get_item_text(index)]["hated"]
	if data.selected_team == "No Team":
		remove_button.disabled = true
		rename_button.disabled = true
		team_hated_box.disabled = true
	else:
		remove_button.disabled = false
		rename_button.disabled = false
		team_hated_box.disabled = false

func add_team(team: String="???", select: bool=false, add_button: bool=true):
	if !data.has_letters(team):
		return
	team = data.resolve_name_conflict(team,teams)
	teams[team] = data.things["team"].duplicate()
	if add_button:
		team_box.add_item(team)
		if select:
			for i in team_box.get_item_count():
				if team_box.get_item_text(i) == team:
					team_box.select(i)
		#print(teams)

func rename_team(team: String="???", to: String="Name"):
	if !data.has_letters(to):
		return
	if teams.has(team) and !teams.has(to):
		add_team(to, true, false)
		teams[to] = teams[team].duplicate(true)
		remove_team(team, false)
		for i in team_box.get_item_count():
			if team_box.get_item_text(i) == team:
				team_box.set_item_text(i,to)

func remove_team(team: String="???", del_button: bool=true):
	if teams.has(team):
		if del_button:
			for i in team_box.get_item_count():
				if team_box.get_item_text(i) == team:
					team_box.remove_item(i)
		teams.erase(team)
		for member_name in data.members:
			if data.members[member_name]["team"] == team:
				data.members[member_name]["team"] = "No Team"
		
func _on_team_add_pressed():
	add_team(team_text_box.text)
func _on_team_remove_pressed():
	remove_team(data.selected_team)
func _on_team_hated_pressed():
	if teams.has(data.selected_team):
		teams[data.selected_team]["hated"] = !teams[data.selected_team]["hated"]
func _on_team_rename_pressed():
	rename_team(data.selected_team, team_text_box.text)

func _ready():
	add_team("No Team",true)
	add_team("Team UwU")
	add_team("Team Sigma")
	add_team("Team Normal")
	add_team("Team Unknown")
	add_team("Tagged And Cursed")
	teams["Tagged And Cursed"]["hated"] = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



