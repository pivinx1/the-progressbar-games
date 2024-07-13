extends Control

var teams = {}
var people = {}
var selected_team = "Nil and Void Team"
@export var team_text_box: LineEdit
@export var team_box: VBoxContainer
@export var team_hated_box: CheckBox

func has_letters(your_string):
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]+")
	if regex.search(str(your_string)):
		return true
	else:
		return false
		
func _on_team_btn_pressed(button):
	selected_team = button.text
	for btn in team_box.get_children():
		btn.disabled = false
		teams[selected_team]["button"].disabled = true
		team_hated_box.button_pressed = teams[selected_team]["hated"]
	print(selected_team)

func add_team(team: String = "???", add_button: bool = true):
	if !has_letters(team):
		team = "Nil and Void Team"
	if !teams.has(team):
		if add_button:
			teams[team] = {"button" = Button.new(), "hated" = false}
			teams[team]["button"].text = team
			teams[team]["button"].pressed.connect(self._on_team_btn_pressed.bind(teams[team]["button"]))
			team_box.add_child(teams[team]["button"])
		selected_team = team
		print(teams)
	else:
		printerr("")

func rename_team(team: String = "???", name: String = "Name"):
	if teams.has(team) and !teams.has(name):
		add_team(name,false)
		teams[name] = teams[team].duplicate(true)
		remove_team(team,false)
		teams[name]["button"].text = name
		_on_team_btn_pressed(teams[name]["button"])

func remove_team(team: String = "???", remove_button: bool = true):
	if teams.has(team):
		if remove_button:
			teams[team]["button"].queue_free()
		teams.erase(team)
		print(teams)
	else:
		printerr("Didn't find team " + team)

func _on_team_add_pressed():
	add_team(team_text_box.text)
func _on_team_remove_pressed():
	remove_team(selected_team)
func _on_team_hated_pressed():
	if teams.has(selected_team):
		teams[selected_team]["hated"] = !teams[selected_team]["hated"]
func _on_team_rename_pressed():
	rename_team(selected_team,team_text_box.text)

func _ready():
	add_team("Team UwU")
	add_team("Team Sigma")
	add_team("Team Normal")
	add_team("Team Unknown")
	add_team("Tagged And Cursed")
	teams["Tagged And Cursed"]["hated"] = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
