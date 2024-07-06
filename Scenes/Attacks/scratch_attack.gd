extends Area2D


var damage: int = 1


func _ready() -> void:
	rotation_degrees = randi_range(-90, 90)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(damage)
