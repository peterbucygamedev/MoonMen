extends Area2D
@onready var add_bullet_speed = $".."


func _on_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0:
			body.p1BulletSpeed += 250
			
		if body.playerNumber == 1:
			body.p2BulletSpeed += 250
			
		if body.playerNumber == 2:
			body.p3BulletSpeed += 250
			
		if body.playerNumber == 3:
			body.p4BulletSpeed += 250
		
		body.power_up_effect.show()
		body.power_up_effect_2.show()
		if body.power_up.is_stopped():
			body.power_up.start()
			
		add_bullet_speed.queue_free()
