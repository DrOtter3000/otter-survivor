extends Node


@onready var timer: Timer = $Timer

@export var wait_time := 90

var difficulty_level = 1


func _ready() -> void:
	timer.wait_time = wait_time
	timer.start()


func _process(delta: float) -> void:
	if  timer.time_left < timer.wait_time * (10 - difficulty_level)*.1:
		difficulty_level += 1
	
	if difficulty_level == 4:
		upgrade_enemy_table()
	elif difficulty_level == 8:
		upgrade_enemy_table()


func upgrade_enemy_table() -> void:
	get_tree().call_group("enemy_spawner_manager", "expand_enemy_table", difficulty_level)


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://UI/end_screen.tscn")
