extends Area2D
@onready var add_bullet_speed = $".."


func _on_body_entered(body):
	if body.is_in_group("players"):
		body.bulletSpeed += 1000
	add_bullet_speed.queue_free()
