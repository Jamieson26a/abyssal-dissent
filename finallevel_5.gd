extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;
var lvl: int;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(5691.0, 331.0), 1, 1]
	}
	
	spawnPositions = [
		Vector2(42.565, -511.664),
		Vector2(-363.0, -219.0),
		Vector2(2440.0, 375.0),
		Vector2(3969.0,-640.0),
		Vector2(4108.0,-505.0)
	]
	
	lvl = 10;
