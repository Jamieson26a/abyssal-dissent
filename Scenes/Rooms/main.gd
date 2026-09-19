extends Node2D
var canInteractWithInteractable;

func _ready():
	canInteractWithInteractable = false;
	
func _process(delta):
	if (Input.is_action_just_pressed("interact") and canInteractWithInteractable):
		$Player.hurt();

func _on_interactable_body_entered(body: Node2D) -> void:
	$Interactable/Label.visible = true;
	canInteractWithInteractable = true;


func _on_interactable_body_exited(body: Node2D) -> void:
	$Interactable/Label.visible = false;
	canInteractWithInteractable = false;
