extends Node


@export var damage := 5
@export var base_attack_intervall_time := 2
@export var attack_range := 250
@export var scratch_attack_scene: PackedScene

@onready var timer: Timer = $Timer


func _ready() -> void:
	$Timer.wait_time = base_attack_intervall_time
	$Timer.start()


func _on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	enemies = enemies.filter(func(enemy: Node2D): 
		return enemy.global_position.distance_squared_to(player.global_position) < pow(attack_range, 2)
	)
	
	if enemies.size() == 0:
		return

	enemies.sort_custom(func(a: Node2D, b: Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance
	)
	
	var scratch_instance = scratch_attack_scene.instantiate() as Node2D
	player.get_parent().add_child(scratch_instance)
	scratch_instance.global_position = enemies[0].global_position
	scratch_instance.damage = damage
	
	$Timer.start()
