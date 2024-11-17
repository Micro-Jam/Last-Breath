extends Area2D



@export var exper =1


var target = null
var speed = 0
#
@onready var sprite = $ColorRect
@onready var collision = $"."
func _ready() -> void:
	if exper <5:
		return
	elif exper<25:
		pass#sprite.color = white 
	else:
		pass#sprite.color = white 
	
	
func _physics_process(delta: float) -> void:
	if target !=null:
		global_position = global_position.move_toward(target.global_position,speed)
		speed +=delta
		
		
func collect():
	#collision.call_deferred("set","disabled",true)
	#sprite.visible =false
	queue_free()
	return exper
