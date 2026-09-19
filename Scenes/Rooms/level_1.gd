extends Node2D

var eldritchActions: Dictionary;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(167.0, 1276.0), 1, 1]
	}
