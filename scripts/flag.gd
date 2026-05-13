extends Area3D

func _on_body_entered(body: Node3D) -> void:
	get_node("/root/Main").show_cleaar_screen()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	body.queue_free()
	queue_free()
