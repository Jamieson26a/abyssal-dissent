extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(151.0, 1048.0), 0, 0],
		"high": [Vector2(1059.844, -884.45), 0, 10],
		"low": [Vector2(1483.0, 39.0), 0, -10]
	}
	
	spawnPositions = [ # ADD MORE
		Vector2(1000, 1100),
		Vector2(1750, 1250)
	]


func _on_area_body_entered(body: Node2D) -> void:
	eldritchActions.erase("high");
	eldritchActions.erase("low");
	
