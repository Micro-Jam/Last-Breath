extends CharacterBody2D

@export var bullet_node : PackedScene

#@onready var en = get_tree().get_first_node_in_group("Enemy")
@onready var player = get_tree().get_first_node_in_group("player")

var can_shoot = true


var health :float= 100:
	set(value):
		health = value
		$ProgressBar.value = value
		if health <=0:
			queue_free()


var direction : Vector2
var speed : float = 50


func _physics_process(delta):
	var distance = (player.position - position).length()
	if distance >= 700:
		queue_free()
	if distance <=200 and can_shoot == true:
		shoot()
		can_shoot = false
		$Timer.start()
		
	move_shoot()
	
	velocity = (player.position - position).normalized() * speed
	move_and_collide(velocity * delta)

func move_shoot():
	if can_shoot != true:
		speed -= 1
		if speed == 10:
			speed +=10
	else:
		speed = 50
func shoot():
	var bullet =bullet_node.instantiate()
	bullet.position = %Marker2D.global_position
	bullet.direction = global_position.normalized()
	get_tree().current_scene.call_deferred("add_child",bullet)

'''func  take_dmg():
	health -=100'''

func _on_timer_timeout() -> void:
	can_shoot = true


func _on_hurt_area_entered(area: Area2D) -> void:
	take_dmg()
func take_dmg():
	health -=50
