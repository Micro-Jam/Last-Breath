extends Node2D


var ship_health :float= 100:
	set(value):
		ship_health = value
		$TextureProgressBar.value = value
		if ship_health <=0:
			get_tree().change_scene_to_file("res://scenes/deadmenu/deadmenu.tscn")
func _on_timer_timeout() -> void:
	ship_health -= 1
