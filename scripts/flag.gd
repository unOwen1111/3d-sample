extends Area3D

func _on_body_entered(body: Node3D) -> void:
	#var canvas_layer = get_tree().get_first_node_in_group("canvas_layer")
	#if canvas_layer:
		#canvas_layer.show_cleaar_screen()
	get_node("/root/Main").show_cleaar_screen()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	body.queue_free()
	queue_free()
