extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func win():
	$Timer.start()
	self.show()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
