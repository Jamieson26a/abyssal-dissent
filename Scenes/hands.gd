extends Node2D

@export var decay = 0.8  # How quickly the shaking stops [0, 1].
@export var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.
@export var max_roll = 0.1  # Maximum rotation in radians (use sparingly).

var shakeTime = 0;

func _ready():
	randomize()
	
func _process(delta):
	if shakeTime > 0:
		shake()
		shakeTime -= delta;
	else:
		shakeTime = 0
		position = Vector2(0,0);
		
func shake():
	var amount = 0.1;
	rotation = max_roll * amount * randf_range(-1, 1)
	position.x += max_offset.x * amount * randf_range(-1, 1)
	position.y += max_offset.y * amount * randf_range(-1, 1)
	
func startShake():
	shakeTime = 0.25;
