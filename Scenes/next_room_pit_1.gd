extends Area2D

func _on_next_room_pit_1_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Rooms/level_2.tscn")
