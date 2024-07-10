extends Node


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://UI/end_screen.tscn")
