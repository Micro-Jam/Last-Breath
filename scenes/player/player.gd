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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movement(delta)
	# print($"CanvasLayer/Control/joystick inner".position)
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/menu/gameover.tscn")


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $CanvasLayer/Control/joystick.is_pressed():
			velocity = calculate_joystick_movement(event.position)
	
		
func calculate_joystick_movement(event_position):
	var texture_center = $CanvasLayer/Control/joystick.position + Vector2(8,8)
	return (event_position - texture_center).normalized()

func movement(delta):##Player's movement
	var direction = Input.get_vector("left","right","up","down");
	velocity = lerp(velocity, direction*speed, delta*10);
	if direction.x < 0:
		animated_sprite.flip_h  = true;
		animated_sprite.play("run")
		move_and_slide()
	elif direction.x > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("run")
		move_and_slide()
	elif direction.y != 0:
		animated_sprite.play("run")
		move_and_slide()
	else:
		animated_sprite.play("idle")
	
func _on_shield_area_entered(area: Area2D) -> void:
	pass


func _on_shield_body_entered(body: Node2D) -> void:
	pass


func _on_hurt_box_body_entered(body: Node2D) -> void:
	health -= 1


func _on_hurt_box_area_entered(area: Area2D) -> void:
	health -= 1
