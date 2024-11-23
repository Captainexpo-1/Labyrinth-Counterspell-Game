extends StaticBody2D


var player = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().root.get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() == player:
		player.set_meta("keys", get_meta("keys") + 1)
		