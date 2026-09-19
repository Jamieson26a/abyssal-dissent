extends CharacterBody2D
var sanity: float;
var timeSinceLastSanityTick: float;
var sanityTick: float;
var player_vars;

func _ready():
	player_vars = get_node("/root/PlayerVariables");
	timeSinceLastSanityTick = 0;
	sanityTick = 50;
	updateHealthLabel();
	sanityUpdate();

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * 1000;
	move_and_slide();
	if (direction.x == 1):
		$Sprite2D.rotation_degrees = 0;
	elif (direction.x == -1):
		$Sprite2D.rotation_degrees = 180;
	elif (direction.y == 1):
		$Sprite2D.rotation_degrees = 90;
	elif (direction.y == -1):
		$Sprite2D.rotation_degrees = 270;
		
	if (direction.length() > 0):
		$Sprite2D.play("walking")
	else:
		$Sprite2D.animation = "default"
		
	timeSinceLastSanityTick += delta;
	if (timeSinceLastSanityTick >= 1):
		player_vars.sanity -= sanityTick;
		timeSinceLastSanityTick = 0;
		sanityUpdate();

func sanityUpdate():
	var level:int = int(player_vars.sanity/100) + 1;
	$RightHand/Eye.animation = str(level) + player_vars.approval;

func _on_hazard_body_entered(body: Node2D) -> void:
	hurt();

func hurt():
	player_vars.health -= 1
	updateHealthLabel();

func updateHealthLabel():
	if (player_vars.health >= 5):
		$RightHand.animation = "0";
		$LeftHand.animation = str(10-player_vars.health);
	elif (player_vars.health >= 0):
		$RightHand.animation = str(5-player_vars.health);
		$LeftHand.animation = "5";
	
