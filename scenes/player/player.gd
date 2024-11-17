extends CharacterBody2D

var speed = 300
var click_position = Vector2(0, 0)

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var health :float= 100:
	set(value):
		health = value
		$health.value = value
		if health <= 0:
			get_tree().change_scene_to_file("res://scenes/deadmenu/deadmenu.tscn")
var direction =0
# Called when the node enters the scene tree for the first time.
func _ready():
	click_position = Vector2(position.x, position.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("click"):
		click_position = get_global_mouse_position()

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


		
	 

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shield"):
		animation.play("shield_equip")


func _on_shield_area_entered(area: Area2D) -> void:
	pass


func _on_shield_body_entered(body: Node2D) -> void:
	pass


func _on_hurt_box_body_entered(body: Node2D) -> void:
	health-=30


func _on_hurt_box_area_entered(area: Area2D) -> void:
	health-=30
