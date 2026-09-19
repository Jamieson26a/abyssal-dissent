extends Node2D

func _on_next_room_pit_body_entered(body: Node2D) -> void:
	(func(): get_tree().change_scene_to_file("res://mainmenu.tscn")).call_deferred()
