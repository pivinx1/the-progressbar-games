extends Control

var teams = {}
@export var team_box: VBoxContainer

func add_team(team: String = "your mom"):
	teams[team] = {"members" = [], "button" = Button.new()}
	teams[team]["button"].text = team
	team_box.add_child(teams[team]["button"])
	print(teams)




# Called when the node enters the scene tree for the first time.
func _ready():
	add_team("Deez Nuts")
	add_team("Skibidi Gyatt")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
