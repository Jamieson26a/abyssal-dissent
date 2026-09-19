extends CharacterBody2D
var sanity: float;
var timeSinceLastSanityTick: float;
var sanityTick: float;
var player_vars = get_node("/root/PlayerVariables")

func _ready():
	sanity = 1000;
	timeSinceLastSanityTick = 0;
	sanityTick = 1;
	$".."/sanity.text = str(sanity);
	updateHealthLabel();

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * 1000;
	move_and_slide();
	if (direction.x == 1):
		$Sprite2D.rotation_degrees = 90;
	elif (direction.x == -1):
		$Sprite2D.rotation_degrees = 270;
	elif (direction.y == 1):
		$Sprite2D.rotation_degrees = 180;
	elif (direction.y == -1):
		$Sprite2D.rotation_degrees = 0;
	
	timeSinceLastSanityTick += delta;
	if (timeSinceLastSanityTick >= 1):
		
		sanity -= sanityTick;
		sanityTick *= 1.1;
		timeSinceLastSanityTick = 0;
		$".."/sanity.text = str(sanity);

func _on_hazard_body_entered(body: Node2D) -> void:
	hurt();

func hurt():
	player_vars.health -= 1;
	updateHealthLabel();

func updateHealthLabel():
	player_vars.health -= 1
	updateLabel();
	


func updateLabel():
	if (player_vars.health >= 5):
		$RightHand.animation = "0";
		$LeftHand.animation = str(10-player_vars.health);
	elif (player_vars.health >= 0):
		$RightHand.animation = str(5-player_vars.health);
		$LeftHand.animation = "5";
