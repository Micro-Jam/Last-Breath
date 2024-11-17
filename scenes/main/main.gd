extends Node2D





func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/deadmenu/deadmenu.tscn")
