extends Area2D


@onready var player = get_tree().get_first_node_in_group("player")

var direction = Vector2.RIGHT
var speed = 300
var distance  = 100


func _physics_process(delta):
	position += direction * speed * delta
	var distance = (player.position - position).length()


func _on_body_entered(body: Node2D) -> void:
	body.health -=50
	queue_free()
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	queue_free()
