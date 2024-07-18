extends Node

# markverb1 says: this code is laughably bad. it does exactly the same thing as teams.gd yet
# i didn't put it in things.gd. dunno why i split teams and members. technically
# teams.gd and members.gd started off as main.gd, extending res://Control.

# these comments are a waste of my time

@export var member_box: ItemList
@export var team_panel: Panel
var members = data.members
var selected_member = data.selected_member

func add_member(member: String="???", select: bool=false, add_button: bool=true):
	if !data.has_letters(member):
		return
	member = data.resolve_name_conflict(member,members)
	members[member] = data.things["member"].duplicate()
	members[member]["team"] = data.selected_team
	if add_button:
		member_box.add_item(member)
		if select:
			for i in member_box.get_item_count():
				if member_box.get_item_text(i) == member:
					member_box.select(i)
	# I LITERALLY JUST FIND AND REPLACED TEAM WITH MEMBER LMFAOOOO
		#print(teams)

func remove_member(member: String="???", remove_button: bool=true):
	if members.has(member):
		if remove_button:
			for i in member_box.get_item_count():
				if member_box.get_item_text(i) == member:
					member_box.remove_item(i)
		members.erase(member)
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if member_box.get_selected_items().size() > 0:
		selected_member = member_box.get_item_text(member_box.get_selected_items()[0])


func _on_add_pressed():
	var rnd_name = data.get_random_name()
	if members.has(rnd_name):
		for i in range(1,5):
			rnd_name = data.get_random_name()
			if !members.has(rnd_name):
				break
		if members.has(rnd_name):
			rnd_name = data.resolve_name_conflict(rnd_name,members)
	add_member(rnd_name,true,true)

func _on_remove_pressed():
	remove_member(selected_member)
	if member_box.get_item_count() > 0:
		member_box.select(member_box.get_item_count()-1)

func _on_team_button_pressed(_team):
	member_box.clear()
	for member_name in members:
		if members[member_name]["team"] == data.selected_team:
			member_box.add_item(member_name)



#func _on_timer_timeout():
	#print(members)



