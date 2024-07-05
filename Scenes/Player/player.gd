extends CharacterBody2D

@export var speed := 200


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction.x < 0:
		$Sprite2D.flip_h = true
	elif direction.x > 0:
		$Sprite2D.flip_h = false
	velocity = direction.normalized() * speed
	
	move_and_slide()
