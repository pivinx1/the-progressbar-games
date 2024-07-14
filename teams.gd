extends Panel
var teams = data.teams
var people = {}
var selected_team = "Nil and Void Team"
@export var team_text_box: LineEdit
@export var team_box: VBoxContainer
@export var team_hated_box: CheckBox

func has_letters(your_string):
	var regex = RegEx.new()
	regex.compile("[a-zA-Z0-9]+")
	return regex.search(str(your_string))
	
func _on_team_btn_pressed(button):
	selected_team = button.text
	for btn in team_box.get_children():
		btn.disabled = false
		teams[selected_team]["button"].disabled = true
		team_hated_box.button_pressed = teams[selected_team]["hated"]
	print(selected_team)

func add_team(team: String="???", select: bool=false, add_button: bool=true):
	if !has_letters(team):
		team = "Nil and Void Team"
	if !teams.has(team):
		if add_button:
			teams[team] = {"button" = Button.new(), "hated" = false}
			teams[team]["button"].text = team
			teams[team]["button"].pressed.connect(self._on_team_btn_pressed.bind(teams[team]["button"]))
			team_box.add_child(teams[team]["button"])
			if select:
				_on_team_btn_pressed(teams[team]["button"])
		print_rich("[color=green]Added " + team + ", now teams are\n" + JSON.stringify(teams,"\t"))

func rename_team(team: String="???", to: String="Name"):
	if !has_letters(to):
		to = "Nil And Void"
	if teams.has(team) and !teams.has(to):
		add_team(to, true, false)
		teams[to] = teams[team].duplicate(true)
		remove_team(team, false)
		teams[to]["button"].text = to
		print_rich("[color=yellow]Renamed " + team + " to " + to + ", now teams are\n" + JSON.stringify(teams,"\t"))

func remove_team(team: String="???", remove_button: bool=true):
	if teams.has(team):
		if remove_button:
			teams[team]["button"].queue_free()
		teams.erase(team)
		print_rich("[color=red]Removed " + team + ", now teams are\n" + JSON.stringify(teams,"\t"))

func _on_team_add_pressed():
	add_team(team_text_box.text)
func _on_team_remove_pressed():
	remove_team(selected_team)
func _on_team_hated_pressed():
	if teams.has(selected_team):
		teams[selected_team]["hated"] = !teams[selected_team]["hated"]
func _on_team_rename_pressed():
	rename_team(selected_team, team_text_box.text)

func _ready():
	add_team("Team UwU")
	add_team("Team Sigma")
	add_team("Team Normal")
	add_team("Team Unknown")
	add_team("Tagged And Cursed")
	teams["Tagged And Cursed"]["hated"] = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
