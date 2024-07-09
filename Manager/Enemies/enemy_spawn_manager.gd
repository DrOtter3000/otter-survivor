extends Node

const SPAWN_RADIUS = 375



@export var duck_enemy_scene: PackedScene
@export var crab_enemy_scene: PackedScene
@export var croc_enemy_scene: PackedScene

@onready var timer: Timer = $Timer

var enemy_table = WeightedTable.new()


func _ready() -> void:
		enemy_table.add_item(duck_enemy_scene, 10)


func get_spawn_position() -> Vector2:
		var player = get_tree().get_first_node_in_group("player")
		if player == null:
				return Vector2.ZERO
		var spawn_position = Vector2.ZERO
		var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))

		spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)

		return spawn_position


func _on_timer_timeout() -> void:
		timer.start()

		var enemy_scene = enemy_table.pick_item()
		var enemy = enemy_scene.instantiate()

		var player = get_tree().get_first_node_in_group("player")
		if player == null:
				return
		var entities_layer = get_tree().get_first_node_in_group("entities")
		entities_layer.add_child(enemy)
		enemy.global_position = get_spawn_position()
