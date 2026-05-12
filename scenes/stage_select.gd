extends Control


var stage_no = 0
var main_scene := preload("res://scenes/main.tscn")
@onready var stage_label = $MainLayout/StageSelectLayout/StagePreviewPanel/StageSelect


func update_stage_label() -> void:
	stage_label.text = "Stage\nNO: " + str(stage_no).pad_zeros(2)

func _on_start_button_pressed() -> void:
	var main = main_scene.instantiate()
	main.stage_no = stage_no
	get_tree().root.add_child(main)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = main

func _on_next_button_pressed() -> void:
	stage_no = (stage_no + 1) % Global.stage_files.size()
	update_stage_label()

func _on_prev_button_pressed() -> void:
	stage_no = (stage_no - 1 + Global.stage_files.size()) % Global.stage_files.size()
	update_stage_label()
