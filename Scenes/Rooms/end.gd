extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;
var lvl: int;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(3201.0, 3725.0), 0, 0]
	}
	
	spawnPositions = [
		Vector2(-5192.545, -5000)
	]
	
	lvl = 12;
