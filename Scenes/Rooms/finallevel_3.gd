extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"low": [Vector2(-3286.0, 2584.0), 1, -5],
		"neutral": [Vector2(37.0, 2631.0), 24, 0],
		"high": [Vector2(-1458.0, 4135.0), 1, 5]
	}
	
	spawnPositions = [
		Vector2(-1602.5, -96.391),
		Vector2(-4567.0, 3338.0),
		Vector2(-107.0, 1800.0),
		Vector2(144.0,1996.0),
		Vector2(404.0,2333.0)
	]
