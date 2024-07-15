extends Node

@export var member_box: VBoxContainer
var members = data.members
var selected_member: String

func _on_member_btn_pressed(button):
	selected_member = button.text
	for btn in member_box.get_children():
		btn.disabled = false
		members[selected_member]["button"].disabled = true
	#print(selected_member)

func add_member(member:String="???",select:bool=false,add_button:bool=true):
	if !data.has_letters(member):
		return
	if !members.has(member):
		members[member] = data.things["member"].duplicate()
		if add_button:
			members[member]["button"] = Button.new()
			members[member]["button"].text = member
			members[member]["button"].pressed.connect(self._on_member_btn_pressed.bind(members[member]["button"]))
			member_box.add_child(members[member]["button"])
		if select:
			_on_member_btn_pressed(members[member]["button"])

func remove_member(member: String="???", remove_button: bool=true):
	if members.has(member):
		if remove_button:
			members[member]["button"].queue_free()
		members.erase(member)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_add_pressed():
	var rnd_name = data.get_random_name()
	if members.has(rnd_name):
		rnd_name = data.resolve_name_conflict(rnd_name,members)
	add_member(rnd_name,true,true)

func _on_remove_pressed():
	remove_member(selected_member)

func _on_teams_team_button_pressed(team):
	for member_name in members:
		var member = members[member_name]
		if member["team"] != team:
			member["button"].hide()
		else:
			member["button"].show()



