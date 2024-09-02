extends Area2D
@onready var add_bullet_speed = $".."


func _on_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0:
			body.p1BulletSpeed += 1000
			
		if body.playerNumber == 1:
			body.p2BulletSpeed += 1000
			
		if body.playerNumber == 2:
			body.p3BulletSpeed += 1000
			
		if body.playerNumber == 3:
			body.p4BulletSpeed += 1000
		add_bullet_speed.queue_free()
