extends Node2D

func _on_button_2_pressed() -> void:
	PlayerVariables.health -= 1
	PlayerVariables.sanity += 300
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_3.tscn")

func _on_button_pressed() -> void:
	PlayerVariables.health += 1
	PlayerVariables.approval -= 1
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_3.tscn")
