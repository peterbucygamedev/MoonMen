extends Area2D




func _on_body_entered(body):
	if body.is_in_group("players"):
		body.burst = true
		queue_free()
		



