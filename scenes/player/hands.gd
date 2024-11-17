extends Node2D


@export var bullet_node = preload("res://scenes/bullet/bullet.tscn")

#@onready var animation: AnimatedSprite2D = $".."
@onready var player = get_tree().get_first_node_in_group("player")
@onready var timer: Timer = $Timer


var num_of_bullets = 4
var can_shoot := true

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _input(event):
	if Input.is_action_just_pressed("shoot") and can_shoot:
	#	animation.play("shoot")
		shoot()
		num_of_bullets -=1
		if num_of_bullets == 0:
			can_shoot  = false
			num_of_bullets += 4
			timer.start()


		
func shoot():
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.direction = (get_global_mouse_position() - global_position).normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)


func _on_timer_timeout() -> void:
	can_shoot = true
