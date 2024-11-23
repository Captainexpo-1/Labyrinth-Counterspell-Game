extends StaticBody2D

var player_positions = []
var player_node = null

var delay = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_node = get_node("../Player")
	
	if player_node == null:
		print("PLAYER IS NULL")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_positions.push_back(player_node.get_data())
	
	while player_positions.size() > delay: 
		player_positions.pop_front()
	
	if player_positions.size() == delay:
		var info = player_positions[0]
		position = info[0]
		$Sprite2D.rotation = info[1]
	pass
