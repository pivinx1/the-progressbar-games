extends Panel

var text: String = ""
var selected: String = "No Team"

func update_team_list():
	pass

func select(team: String):
	selected = team

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_add_team_pressed():
	pass # Replace with function body.


func _on_remove_team_pressed():
	pass # Replace with function body.


func _on_rename_team_pressed():
	pass # Replace with function body.


func _on_hated_tick_toggled(toggled_on):
	pass # Replace with function body.


func _on_text_text_changed(new_text):
	text = new_text
