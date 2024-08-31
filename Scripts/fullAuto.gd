extends Area2D
@onready var full_auto = $".."


func _on_body_entered(body):
	if body.is_in_group("players"):
		body.fullAuto = true
	full_auto.queue_free()
