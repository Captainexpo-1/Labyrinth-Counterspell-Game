extends StaticBody2D

var player_positions = []
var player_node = null

var delay = 1.5*60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_node = get_node("../Player")
	
	if player_node == null:
		print("PLAYER IS NULL")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not get_meta("Following"): return
	
	player_positions.push_back(player_node.get_data())
	
	while player_positions.size() > delay: 
		player_positions.pop_front()
	
	if player_positions.size() == delay:
		var info = player_positions[0]
		position = info[0]
		$GFX.rotation = info[1]
		if info[2].length() != 0:
			$GFX.play("default")
		else:
			$GFX.stop()
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("COLLISION")
	if area.get_parent() == player_node:
		player_node.kill(self)
		$"../Menu".set_next_state()  
