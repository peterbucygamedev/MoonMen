extends Area2D
@onready var burst = $".."



func _on_body_entered(body):
	if body.is_in_group("players"):
		body.burst = true
	burst.queue_free()
