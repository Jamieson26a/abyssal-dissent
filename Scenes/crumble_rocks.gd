extends StaticBody2D

func _ready():
	$AnimatedSprite2D.animation = "rocks";
	set_collision_layer_value(2, false);
	set_collision_layer_value(3, false);
	print("ding")
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	$AnimatedSprite2D.animation = "void";
	set_collision_layer_value(2, true);
	set_collision_layer_value(3, true);
	print("dong")
	
