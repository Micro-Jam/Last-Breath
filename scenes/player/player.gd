extends CharacterBody2D

var speed = 300
var click_position = Vector2(0, 0)

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var health = 10:
	set(value):
		health = value
		$CanvasLayer/health.value = value
		if health <= 0:
			#get_tree().change_scene_to_file("res://scenes/deadmenu/deadmenu.tscn")
			pass
func _physics_process(delta: float) -> void:
	movement(delta)

<<<<<<< Updated upstream
func movement(delta):##Player's movement
	var direction = Input.get_vector("left","right","up","down");
	velocity = lerp(velocity, direction*speed, delta*10);
	if direction.x < 0:
		animated_sprite.flip_h  = true;
		animated_sprite.play("run")
	elif direction.x > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	move_and_slide();
=======

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("click"):
		click_position = get_global_mouse_position()
		
	# print($"CanvasLayer/Control/joystick inner".position)
	
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/menu/gameover.tscn")
	
	var target_position = (click_position - position).normalized()
	
	print(target_position)
	
	if velocity != Vector2.ZERO:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	if position.distance_to(click_position) > 3:
		velocity = target_position * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	
	if velocity.x < 0:
		animated_sprite.flip_h = true
	elif velocity.x > 0:
		animated_sprite.flip_h = false


		
	 


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shield"):
		animation.play("shield_equip")
		
	
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $CanvasLayer/Control/joystick.is_pressed():
			click_position = calculate_joystick_movement(event.position)
	
		
func calculate_joystick_movement(event_position):
	var texture_center = $CanvasLayer/joystick.position + Vector2(8,8)
	return (event_position - texture_center).normalized()
	
func _on_shield_area_entered(area: Area2D) -> void:
	pass


func _on_shield_body_entered(body: Node2D) -> void:
	pass
>>>>>>> Stashed changes


func _on_hurt_box_body_entered(body: Node2D) -> void:
	health -= 1


func _on_hurt_box_area_entered(area: Area2D) -> void:
	health -= 1
