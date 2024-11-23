extends StaticBody2D

var player = null
var d = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.distance_to(player.position) < d:
		if player.get_meta("keys") >= 3:
			$AnimatedSprite2D.play("default")
			$CollisionShape2D.queue_free()
