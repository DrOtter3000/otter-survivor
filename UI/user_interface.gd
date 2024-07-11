extends CanvasLayer


@onready var progress_bar: ProgressBar = $ProgressBar


func update_upgrade_bar(value: float, max_value: int) -> void:
	progress_bar.value = value
	progress_bar.max_value = max_value
