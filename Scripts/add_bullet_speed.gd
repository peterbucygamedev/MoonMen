extends Area2D
@onready var add_bullet_speed = $".."
var addAmount := 750

func _on_body_entered(body):
	if body.is_in_group("players"):
		
		body.bulletSpeed += addAmount
		body.power_up_effect.show()
		body.power_up_effect_2.show()
		if body.power_up.is_stopped():
			body.power_up.start()
			
		add_bullet_speed.queue_free()
