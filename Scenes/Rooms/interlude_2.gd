extends Node2D

func _on_button_pressed() -> void:
	PlayerVariables.changeHealth(-1);
	PlayerVariables.changeSanity(300)
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_3.tscn")

func _on_button_2_pressed() -> void:
	PlayerVariables.changeHealth(1)
	PlayerVariables.changeApproval(-3)
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_3.tscn")
