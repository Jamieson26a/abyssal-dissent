extends CharacterBody2D
var sanity: float;
var timeSinceLastSanityTick: float;
var sanityTick: float;
var player_vars;
var globalAudio;
var sanityInt10: int
var sanityString: String

@onready var player_music_player := $AudioStreamPlayer as AudioStreamPlayer
@onready var walk_music_player := $AudioStreamPlayer2D as AudioStreamPlayer2D

var yielding: bool;

# For the eldritch
var taskPositions: Array;
var currentTarget: Vector2;
var movement_speed: float = 200.0;
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _ready():
	player_vars = get_node("/root/PlayerVariables");
	globalAudio = get_node("/root/GlobalAudio");
	timeSinceLastSanityTick = 0;
	sanityInt10 = int(player_vars.sanity/100)
	sanityTick = 5;
	yielding = false;
	taskPositions = [];
	currentTarget = position;
	
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 80.0
	navigation_agent.target_desired_distance = 4.0
	
	actor_setup.call_deferred()
	updateHealthLabel();
	sanityUpdate();

func actor_setup():
	await get_tree().physics_frame;
	
func set_movement_target(movement_target: Vector2):
	currentTarget = movement_target;
	navigation_agent.set_target_position(movement_target)

func _process(delta):
	var direction;
	if (not yielding):
		sanityTick = 5;
		direction = Input.get_vector("left", "right", "up", "down");
		velocity = direction * 750;
		move_and_slide();
		if (direction == Vector2(1, 0) or direction.is_equal_approx(Vector2(0.707107, -0.707107))):
			$Sprite2D.rotation_degrees = 0;
		elif (direction == Vector2(-1, 0) or direction.is_equal_approx(Vector2(-0.707107, 0.707107))):
			$Sprite2D.rotation_degrees = 180;
		elif (direction == Vector2(0, 1) or direction.is_equal_approx(Vector2(0.707107, 0.707107))):
			$Sprite2D.rotation_degrees = 90;
		elif (direction == Vector2(0, -1) or direction.is_equal_approx(Vector2(-0.707107, -0.707107))):
			$Sprite2D.rotation_degrees = 270;
		if direction != Vector2(0,0):
			walk_music_player["stream_paused"] = false
		else:
			walk_music_player["stream_paused"] = true
	else:
		direction = Vector2(0,0)
		sanityTick = 20;
		
	if (direction.length() > 0):
		if (abs(direction.x) < 1 and abs(direction.y) < 1):
			$Sprite2D.play("walkingDiagonal")
		else:
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
	
	if sanityString != globalAudio.current_sanity:
		globalAudio.current_sanity = sanityString
		update_music_for_sanity()
		
	if (Input.is_action_just_pressed("yield")):
		if (not yielding):
			yielding = true;
			$YieldPrompt.text = "PRESS Q TO TAKE BACK OVER"
			yieldToEntity();
		else:
			yielding = false;
			$YieldPrompt.text = "PRESS Q TO YIELD"
			set_collision_layer_value(3, true);
			set_collision_mask_value(3, true);

func update_music_for_sanity():
	var current_sanity_music = str(sanityString + "sanity")
	player_music_player["parameters/switch_to_clip"] = current_sanity_music

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		nextTask();
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	
	if (yielding):
		var direction = current_agent_position.direction_to(next_path_position)
		velocity = direction * movement_speed
		move_and_slide();
		if (velocity.x >= abs(velocity.y)):
			$Sprite2D.rotation_degrees = 0;
		elif (velocity.x <= -abs(velocity.y)):
			$Sprite2D.rotation_degrees = 180;
		elif (velocity.y > 0):
			$Sprite2D.rotation_degrees = 90;
		elif (velocity.y < 0):
			$Sprite2D.rotation_degrees = 270;

func sanityUpdate():
	var level:int = int(player_vars.sanity/100) + 1;
	if (level < 1):
		level = 1;
	elif (level > 10):
		level = 10;
	var approvalStr = ""
	if (player_vars.approval < -4):
		approvalStr = "n"
	elif (player_vars.approval > 4):
		approvalStr = "y"
	$RightHand/Eye.animation = str(level) + approvalStr;

func _on_hazard_body_entered(body: Node2D) -> void:
	hurt();

func _on_spike_hazard_body_entered(body: Node2D) -> void:
	hurt();

func _on_tutorial_pit_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://mainmenu.tscn")
	resetafterexitorenter()

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
	elif (player_vars.health <= 0):
		death()

func death():
	get_tree().change_scene_to_file("res://Scenes/Death_Screen.tscn")
	resetafterexitorenter()

func resetafterexitorenter():
	player_vars.health = 10
	player_vars.sanity = 1000
	
func yieldToEntity():
	taskPositions = entityPrioritize();
	nextTask();
	set_collision_layer_value(3, false);
	set_collision_mask_value(3, false);
	
func nextTask():
	if (taskPositions.size() != 0):
		set_movement_target(taskPositions.pop_front());
	
func entityPrioritize() -> Array:
	var possibleActions = $"..".eldritchActions;
	if (possibleActions != null):
		var positions = [];
		var priorities = [];
		for action in possibleActions:
			positions.append(possibleActions[action][0])
			var priority = possibleActions[action][1] + (possibleActions[action][2]*player_vars.approval);
			priorities.append(priority);
		var index:int = 0;

		if (priorities.size() > 1):
			while (index < priorities.size()):
				if (index == 0):
					index += 1;
				if (priorities[index] <= priorities[index - 1]):
					index += 1;
				else:
					var temp = priorities[index];
					priorities[index] = priorities[index - 1];
					priorities[index - 1] = temp;
					
					temp = positions[index];
					positions[index] = positions[index - 1];
					positions[index - 1] = temp;
					
					index -= 1;
		return positions;
	else:
		return [];

func _on_next_room_pit_1_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/level_2.tscn")


func _on_buggy_hit_box_body_entered(body: Node2D) -> void:
	hurt()

func _on_lava_entered(body: Node2D) -> void:
	if (not yielding):
		hurt();
