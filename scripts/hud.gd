extends CanvasLayer

@onready var goal_label: Label = $GoalLabel

func show_goal_text() -> void:
	goal_label.visible = true
