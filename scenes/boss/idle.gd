extends State

@onready var collision = $"../../detection/detection_collision"
@onready var progress_bar: ProgressBar = $"../../ProgressBar"



var player_entered : bool = false:
	set (value):
		player_entered = value
		collision.set_deferred("disabled",value)
		progress_bar.set_deferred("visible",value)
		



func _on_detection_body_entered(body):
	player_entered = true
	
func transition():
	if player_entered:
		get_parent().change_state("follow")
	
