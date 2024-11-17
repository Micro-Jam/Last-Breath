extends CharacterBody2D

var speed = 300
var click_position = Vector2(0, 0)

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

var health :float= 100:
	set(value):
		health = value
		$health.value = value

# Called when the node enters the scene tree for the first time.
func _ready():
	click_position = Vector2(position.x, position.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("click"):
		click_position = get_global_mouse_position()
		
	var target_position = (click_position - position).normalized()
	
	if position.distance_to(click_position) > 3:
		velocity = target_position * speed
		move_and_slide()
	if velocity.x <0:
		sprite.flip_h = true
	elif velocity.x>0:
		sprite.flip_h = false
	 

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
