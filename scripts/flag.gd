extends Area3D

func _on_body_entered(body: Node3D) -> void:
	var hud = get_tree().get_first_node_in_group("hud")
	if hud:
		hud.show_goal_text()
		queue_free()
