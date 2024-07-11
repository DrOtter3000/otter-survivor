extends Node

var clams := 0
var next_level := 10


func add_clam() -> void:
	clams += 1
	if clams == next_level:
		clams -= next_level
		next_level = int(next_level * 1.2)
	get_tree().call_group("GUI", "update_upgrade_bar", clams, next_level)
