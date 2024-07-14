extends Panel
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
		data.teams[selected_team]["button"].disabled = true
		team_hated_box.button_pressed = data.teams[selected_team]["hated"]
	print(selected_team)

func add_team(team: String="???", select: bool=false, add_button: bool=true):
	if !has_letters(team):
		team = "Nil and Void Team"
	if !data.teams.has(team):
		if add_button:
			data.teams[team] = {"button" = Button.new(), "hated" = false}
			data.teams[team]["button"].text = team
			data.teams[team]["button"].pressed.connect(self._on_team_btn_pressed.bind(data.teams[team]["button"]))
			team_box.add_child(data.teams[team]["button"])
			if select:
				_on_team_btn_pressed(data.teams[team]["button"])
		print(data.teams)

func rename_team(team: String="???", to: String="Name"):
	if !has_letters(to):
		to = "Nil And Void"
	if data.teams.has(team) and !data.teams.has(to):
		add_team(to, true, false)
		data.teams[to] = data.teams[team].duplicate(true)
		remove_team(team, false)
		data.teams[to]["button"].text = to

func remove_team(team: String="???", remove_button: bool=true):
	if data.teams.has(team):
		if remove_button:
			data.teams[team]["button"].queue_free()
		data.teams.erase(team)
		print(data.teams)

func _on_team_add_pressed():
	add_team(team_text_box.text)
func _on_team_remove_pressed():
	remove_team(selected_team)
func _on_team_hated_pressed():
	if data.teams.has(selected_team):
		data.teams[selected_team]["hated"] = !data.teams[selected_team]["hated"]
func _on_team_rename_pressed():
	rename_team(selected_team, team_text_box.text)

func _ready():
	add_team("Team UwU")
	add_team("Team Sigma")
	add_team("Team Normal")
	add_team("Team Unknown")
	add_team("Tagged And Cursed")
	data.teams["Tagged And Cursed"]["hated"] = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
