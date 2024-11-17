extends Node2D





func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
