extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_group("upgrade_manager", "add_clam")
		queue_free()
