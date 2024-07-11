extends PanelContainer


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_mouse_entered() -> void:
	animation_player.play("hover")
