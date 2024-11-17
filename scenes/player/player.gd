extends CharacterBody2D

var speed = 300
var click_position = Vector2(0, 0)

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar: AnimatedSprite2D = $CanvasLayer/Control/health

var health = 3:
	set(value):
		health = value
		if value == 3:
			health_bar.play("3")
		elif value == 2:
			health_bar.play("2")
		elif value == 1:
			health_bar.play("1")
		else:
			print("moira gesi")
		print(value)
		
var direction =0
# Called when the node enters the scene tree for the first time.
func _ready():
	click_position = Vector2(position.x, position.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("click"):
		click_position = get_global_mouse_position()
		direction =1
	var target_position = (click_position - position).normalized()
	
	if target_position ==Vector2.ZERO:
		animated_sprite.play("idle")
	elif target_position !=Vector2.ZERO:
		animated_sprite.play("run")
	
	if position.distance_to(click_position) > 3:
		velocity = target_position * speed
		move_and_slide()
	if velocity.x <0:
		animated_sprite.flip_h = true
	elif velocity.x>0:
		animated_sprite.flip_h = false
	
	
	# custom hp
	

		
	 

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shield"):
		animation.play("shield_equip")
		camShake+=30;
@onready var cam = $Camera2D
var camspd = 10;#Cam move spd
var camShake = 0.0;#Cam shakeyness variable(0=no shake, 100=very shakey)
func camera(delta):##Code for player's camera
	camShake=lerp(camShake, 0.0, delta*100);#Return shakeyness to 0

func _on_shield_area_entered(area: Area2D) -> void:
	pass


func _on_shield_body_entered(body: Node2D) -> void:
	pass
