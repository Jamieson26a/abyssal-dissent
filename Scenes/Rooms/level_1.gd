extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(151.0, 1048.0), 1, 1],
		"thingy": [Vector2(1000, 1100), 0, -5]
	}
	
	spawnPositions = [
		Vector2(1000, 1100),
		Vector2(1750, 1250)
	]
