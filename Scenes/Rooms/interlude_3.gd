extends Node2D

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_4.tscn")
	PlayerVariables.health += 2
	PlayerVariables.sanity += 500

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_4.tscn")
	PlayerVariables.approval += 4
