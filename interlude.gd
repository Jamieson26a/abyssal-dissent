extends Node2D



func _on_button_pressed() -> void:
	PlayerVariables.approval -= 1
	PlayerVariables.sanity += 200
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_2.tscn")

func _on_button_2_pressed() -> void:
	PlayerVariables.approval += 1
	PlayerVariables.sanity -= 200
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_2.tscn")
