extends CharacterBody2D
class_name Enemy

@export var speed := 100
@export var hitpoints := 20


var player: CharacterBody2D


func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _physics_process(delta: float) -> void:
	var direction := player.global_position - position
	velocity = direction.normalized() * speed
	
	if direction.x < 0:
		$Sprite2D.flip_h = false
	elif direction.x > 0:
		$Sprite2D.flip_h = true
	
	if velocity != Vector2.ZERO:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.stop()

	move_and_slide()


func take_damage(value):
	hitpoints -= value
	if hitpoints <= 0:
		die()
	$Sprite2D.modulate = Color.RED
	await get_tree().create_timer(.1).timeout
	$Sprite2D.modulate = Color.WHITE


func die():
	queue_free()
