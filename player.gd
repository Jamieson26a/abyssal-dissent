extends CharacterBody2D
var sanity: float;
var timeSinceLastSanityTick: float;
var sanityTick: float;
var player_vars;
var sanityInt10: int
var sanityString: String

@export var player_music_player: AudioStreamPlayer

func _ready():
	player_vars = get_node("/root/PlayerVariables");
	timeSinceLastSanityTick = 0;
	sanityTick = 10;
	sanityInt10 = int(player_vars.sanity/100)
	updateHealthLabel();
	sanityUpdate();

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * 750;
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
	
	sanityInt10 = int(player_vars.sanity/100)
	
	if sanityInt10 > 0 and 3 >= sanityInt10:
		sanityString = "low"
	
	if sanityInt10 > 3 and 6 >= sanityInt10:
		sanityString = "mid"
	
	if sanityInt10 > 6 and 10 >= sanityInt10:
		sanityString = "high"
	
	if sanityString != GlobalAudio.current_sanity:
		GlobalAudio.current_sanity = sanityString
		update_music_for_sanity()
		

func update_music_for_sanity():
	var current_sanity_music = str(sanityString + "sanity")
	player_music_player["parameters/switch_to_clip"] = current_sanity_music

func sanityUpdate():
	var level:int = int(player_vars.sanity/100) + 1;
	$RightHand/Eye.animation = str(level) + player_vars.approval;

func _on_hazard_body_entered(body: Node2D) -> void:
	hurt();

func _on_spike_hazard_body_entered(body: Node2D) -> void:
	hurt();

func _on_tutorial_pit_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://mainmenu.tscn")
	resetafterexitorenter()
	print("bye")

func hurt():
	player_vars.health -= 1
	updateHealthLabel();

func updateHealthLabel():
	print(player_vars.health)
	if (player_vars.health >= 5):
		$RightHand.animation = "0";
		$LeftHand.animation = str(10-player_vars.health);
	elif (player_vars.health >= 0):
		$RightHand.animation = str(5-player_vars.health);
		$LeftHand.animation = "5";
	elif (player_vars.health <= 0):
		death()

func death():
	get_tree().change_scene_to_file("res://Scenes/Death_Screen.tscn")
	resetafterexitorenter()
	print("bleh")

func resetafterexitorenter():
	player_vars.health = 10
	player_vars.sanity = 1000
	

func _on_next_room_pit_1_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/level_2.tscn")
	print("boo")


func _on_buggy_hit_box_body_entered(body: Node2D) -> void:
	hurt()
	print("buggy")
	
