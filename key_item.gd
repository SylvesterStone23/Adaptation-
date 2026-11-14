extends Area2D


func _on_body_entered(body):
	if body.is_in_group("player"):
		if "has_key" in body:
			body.has_key = true
		
		# THIS SHOWS ON SCREEN:
		var message_label = get_tree().root.get_node_or_null("main/CanvasLayer/MessageLabel")
		if message_label:
			message_label.text = "You got a key"
		
		queue_free()
