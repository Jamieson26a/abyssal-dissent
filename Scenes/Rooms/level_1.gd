extends Node2D

var eldritchActions: Dictionary;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(151.0, 1048.0), 1, 1],
		"thingy": [Vector2(1000, 1100), 0, -5]
	}
