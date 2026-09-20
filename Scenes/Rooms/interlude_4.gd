extends Node2D

func _on_button_pressed() -> void:
	PlayerVariables.changeSanity(-500)
	get_tree().change_scene_to_file("res://finallevel_5.tscn")
