extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;
var lvl: int;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(11820.0, 42.0), 0, 0]
	}
	
	spawnPositions = [
		Vector2(-5192.545, -5000)
	]
	
	lvl = 12;

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Finish.tscn");
