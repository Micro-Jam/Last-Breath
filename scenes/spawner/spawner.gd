extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")

var distance = 300

var enemy_node_Boss = preload("res://scenes/boss/boss.tscn")
var enemy_node_B = preload("res://scenes/enemies/enemy_2.tscn")
var enemy_node = preload("res://scenes/enemies/enemy_1.tscn")
var can_spawn_A =  true
var can_spawn_B =  true
var can_spawn_Boss


var stop_spawn = false




func spawn_a(pos : Vector2):
	#if can_spawn_A == true and stop_spawn == false:
		var enemy = enemy_node.instantiate()
		add_child(enemy)
		can_spawn_A = false
		enemy.position = pos


func spawn_b(pos : Vector2):
	#if can_spawn_B == true and stop_spawn_B == false:
		var enemy_B = enemy_node_B.instantiate()
		add_child(enemy_B)
		can_spawn_B = false
		enemy_B.position = pos
func spawn_boss(pos : Vector2):
	#if can_spawn_B == true and stop_spawn_B == false:
		var enemy_Boss = enemy_node_Boss.instantiate()
		add_child(enemy_Boss)
		can_spawn_B = false
		enemy_Boss.position = pos





func spawn_pos():
	return player.position + distance * Vector2.RIGHT.rotated(randf_range(0, 2 * PI))
	
func _on_timer_timeout() -> void:
	can_spawn_A = true
	spawn_a(spawn_pos())
	#number_of_spawned +=1
	
	


func _on_timerb_timeout() -> void:
	can_spawn_B = true
	spawn_b(spawn_pos())


func _on_boss_timer_timeout() -> void:
	can_spawn_Boss = true
	spawn_boss(spawn_pos())
