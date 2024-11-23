extends StaticBody2D

var player = null
var d = 25
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = $"../Player"

var opened = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(position.distance_to(player.position))
	if position.distance_to(player.position) < d && not opened:
		if player.get_meta("keys") >= 3:
			$AnimatedSprite2D.play("default")
			$CollisionShape2D.disabled = true;
			opened = true
			
	
