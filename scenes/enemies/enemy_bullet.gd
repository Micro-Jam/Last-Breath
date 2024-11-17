extends Area2D


var player
var direction
var speed = 250

func _ready():
	player = get_parent().find_child("player")
	direction  = (player.position - position).normalized()
	
	
func _physics_process(delta):
	position += direction *speed *delta
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	body.health -=10
	queue_free()
	

	


func _on_area_entered(area: Area2D) -> void:
	queue_free()
