extends CharacterBody2D
class_name Enemy

@export var speed := 100

var player: CharacterBody2D


func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _physics_process(delta: float) -> void:
	var direction := player.global_position - position
	if direction.x < 0:
		$Sprite2D.flip_h = false
	elif direction.x > 0:
		$Sprite2D.flip_h = true
	velocity = direction.normalized() * speed
	
	move_and_slide()
