extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(500, 1750), 1, 1]
	}
	
	spawnPositions = [
		Vector2(2600, 1750),
		Vector2(1750, 1000)
	]
