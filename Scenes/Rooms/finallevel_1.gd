extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;
var lvl: int;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(-336.933, 1263.292), 1, 1]
	}
	
	spawnPositions = [
		Vector2(1151.0, 755.0),
		Vector2(1755.0, 657.0)
	]
	
	lvl = 2;
