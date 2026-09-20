extends Node2D
var win:Window = Window.new()

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial_level.tscn")


func _on_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/finallevel_1.tscn")

func _on_button_4_pressed() -> void:
	get_tree().quit()
