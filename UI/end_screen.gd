extends Control


func _on_btn_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level/main_scene.tscn")


func _on_btn_quit_pressed() -> void:
	get_tree().quit()
