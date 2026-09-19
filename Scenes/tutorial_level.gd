extends Node2D

var eldritchActions: Dictionary;

func _ready() -> void:
	# Format: [Position of action, base priority, approval weight]
	eldritchActions = {
		"end": [Vector2(151.0, 1048.0), 1, 1],
		"thingy": [Vector2(1000, 1100), 0, -5]
	}


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
