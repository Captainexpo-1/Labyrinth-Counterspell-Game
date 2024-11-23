extends CharacterBody2D

var speed = 400  # move speed in pixels/sec
var rotation_speed = 4  # turning speed in radians/sec


func wrap_angle(angle: float) -> float:
	return fmod(angle + PI, TAU) - PI

func kill(other: Node2D):
	set_meta("alive", false)
	set_meta("canmove", false)

func get_data():
	return [position, rotation, velocity]

func _physics_process(delta):
	var dy = Input.get_axis("ui_down", "ui_up")
	var dx = Input.get_axis("ui_left", "ui_right")
	
	if not get_meta("canmove"):
		dy = 0
		dx = 0
	
	# Calculate movement vector
	var movement = (Vector2.RIGHT * dx - Vector2.UP * -dy) * speed
	
	set_meta("moving", movement.length() > 1)
	# Normalize movement vector if its length exceeds 1
	if movement.length() > 1:
		movement = movement.normalized() * speed
	
	velocity = movement
	
	look_at(position + velocity)
	
	if movement.length() != 0:
		$GFXContainer/GFX.play("default")
	else:
		$GFXContainer/GFX.stop()
	
	# Move the character
	move_and_slide()
