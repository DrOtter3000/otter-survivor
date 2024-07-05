extends CharacterBody2D

@export var speed := 200
@export var hitpoints := 100


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * speed
	
	if direction.x < 0:
		$Sprite2D.flip_h = true
	elif direction.x > 0:
		$Sprite2D.flip_h = false
	
	if velocity != Vector2.ZERO:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.stop()

	move_and_slide()
