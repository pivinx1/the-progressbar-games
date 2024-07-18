extends Node

# markverb1 says: this code is laughably bad. it does exactly the same thing as teams.gd yet
# i didn't put it in things.gd. dunno why i split teams and data.members. technically
# teams.gd and data.members.gd started off as main.gd, extending res://Control.

# these comments are a waste of my time

@export var member_box: ItemList
@export var team_panel: Panel

func add_member(member: String="???", select: bool=false, add_button: bool=true):
	if !data.has_letters(member):
		return
	member = data.resolve_name_conflict(member,data.members)
	data.members[member] = data.things["member"].duplicate()
	data.members[member]["name"] = member
	data.members[member]["team"] = data.selected_team
	if add_button:
		var item = member_box.add_item(member)
		if select:
			member_box.select(item)
	# I LITERALLY JUST FIND AND REPLACED TEAM WITH MEMBER LMFAOOOO
		

func remove_member(member: String="???", remove_button: bool=true):
	if data.members.has(member):
		if remove_button:
			for i in member_box.get_item_count():
				if member_box.get_item_text(i) == member:
					member_box.remove_item(i)
		data.selected_member = ""
		data.members.erase(member)
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if member_box.get_selected_items().size() > 0:
		data.selected_member = member_box.get_item_text(member_box.get_selected_items()[0])
		#print(data.selected_member)
	#print(data.members)


func _on_add_pressed():
	var rnd_name = data.get_random_name()
	if data.members.has(rnd_name):
		for i in range(1,5):
			rnd_name = data.get_random_name()
			if !data.members.has(rnd_name):
				break
		if data.members.has(rnd_name):
			rnd_name = data.resolve_name_conflict(rnd_name,data.members)
	add_member(rnd_name,true,true)

func _on_remove_pressed():
	remove_member(data.selected_member)
	if member_box.get_item_count() > 0:
		member_box.select(member_box.get_item_count()-1)

func _on_team_button_pressed(_team):
	member_box.clear()
	for member_name in data.members:
		if data.members[member_name]["team"] == data.selected_team:
			member_box.add_item(member_name)



#func _on_timer_timeout():
	#print(data.members)



