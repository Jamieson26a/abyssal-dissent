extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;
var lvl: int;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(3201.0, 3725.0), 1, 1]
	}
	
	spawnPositions = [
		Vector2(5192.545, 390.984),
		Vector2(4590.0, 403.0),
		Vector2(4098.0, 591.0),
		Vector2(260.0,1775.0),
		Vector2(-490.0,2164.0),
		Vector2(-117.0,2996.0),
		Vector2(2476.0,3160.0)
	]
	
	lvl = 4;
