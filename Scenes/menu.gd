class_name GameState extends CanvasLayer


enum states {PAUSED, PLAYING}
var current_state

# Called when the node enters the scene tree for the first time.
func _ready():
	self.current_state = states.PAUSED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_current_state() == states.PAUSED:
		self.show()
	else:
		self.hide()
	
func get_current_state():
	return current_state

func set_next_state():
	if get_current_state() == states.PAUSED:
		self.current_state = states.PLAYING
	else:
		self.current_state = states.PAUSED


func _on_color_rect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			set_next_state()
			$"../Player".revive()
