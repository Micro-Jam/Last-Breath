extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var progress_bar = $ProgressBar


var direction :  Vector2
var health: = 100:
	set(value):
		health = value
		progress_bar.value = value
		if value <=0:
			progress_bar.visible = false
			find_child("StateFiniteMachine").change_state("death")
func _ready():
	set_physics_process(false)
	
func _process(_delta):
	direction = player.position - position
	if direction.x<0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
		
		
func _physics_process(delta):
	velocity = direction.normalized() *40
	move_and_collide(velocity *delta )
func take_dmg():
	health -=40
