extends AudioStreamPlayer
@export var tickbox: CheckBox
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_music_pressed():
	if tickbox.button_pressed:
		if not self.playing:
			self.playing = true
		self.volume_db = -10
	else:
		self.volume_db = -80
