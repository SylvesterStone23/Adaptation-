extends Area2D


func _on_body_entered(body):
	if body.is_in_group("player2"):
		var message_label = get_tree().root.get_node_or_null("main/CanvasLayer/MessageLabel")

		if "has_key" in body and body.has_key:
			if message_label:
				message_label.text = "You escaped!"
			get_tree().change_scene_to_file("res://win_screen.tscn")
		else:
			if message_label:
				message_label.text = "The door is locked. Find the key!"
