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
			#get_tree().change_scene_to_file("res://scenes/deadmenu/deadmenu.tscn")
			pass
func _physics_process(delta: float) -> void:
	movement(delta)

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


func _on_hurt_box_body_entered(body: Node2D) -> void:
	health-=30


func _on_hurt_box_area_entered(area: Area2D) -> void:
	health-=30
