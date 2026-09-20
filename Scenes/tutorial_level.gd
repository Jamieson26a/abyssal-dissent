extends Node2D

var eldritchActions: Dictionary;
var spawnPositions: Array;
var lvl:int;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(1500, 1250), 1, 0]
	}
	spawnPositions = [
		Vector2(-10000, -10000)
	]
	
	lvl = 0;
	


func _on_interactable_body_entered(body: Node2D) -> void:
	$Interactable/Label.visible = true;

func _on_interactable_body_exited(body: Node2D) -> void:
	$Interactable/Label.visible = false;

func _on_interactable_2_body_entered(body: Node2D) -> void:
	$Interactable2/Label.visible = true;

func _on_interactable_2_body_exited(body: Node2D) -> void:
	$Interactable2/Label.visible = false;

func _on_interactable_3_body_entered(body: Node2D) -> void:
	$Interactable3/Label.visible = true;

func _on_interactable_3_body_exited(body: Node2D) -> void:
	$Interactable3/Label.visible = false;

func _on_interactable_4_body_entered(body: Node2D) -> void:
	$Interactable4/Label.visible = true;

func _on_interactable_4_body_exited(body: Node2D) -> void:
	$Interactable4/Label.visible = false;

func _on_interactable_5_body_entered(body: Node2D) -> void:
	$Interactable5/Label.visible = true;

func _on_interactable_5_body_exited(body: Node2D) -> void:
	$Interactable5/Label.visible = false;

func _on_interactable_6_body_entered(body: Node2D) -> void:
	$Interactable6/Label.visible = true;

func _on_interactable_6_body_exited(body: Node2D) -> void:
	$Interactable6/Label.visible = false;
