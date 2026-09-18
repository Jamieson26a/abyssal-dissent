extends CharacterBody2D
var health

func _ready():
	health = 10
	updateLabel();

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * 500;
	move_and_slide();
	if (direction.x == 1):
		$Sprite2D.rotation_degrees = 90;
	elif (direction.x == -1):
		$Sprite2D.rotation_degrees = 270;
	elif (direction.y == 1):
		$Sprite2D.rotation_degrees = 180;
	elif (direction.y == -1):
		$Sprite2D.rotation_degrees = 0;

func _on_hazard_body_entered(body: Node2D) -> void:
	health -= 1;
	updateLabel();

func updateLabel():
	if (health >= 5):
		$".."/RightHand.animation = "0";
		$".."/LeftHand.animation = str(10-health);
	elif (health >= 0):
		$".."/RightHand.animation = str(5-health);
		$".."/LeftHand.animation = "5";
