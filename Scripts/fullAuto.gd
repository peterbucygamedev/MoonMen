extends Area2D
@onready var full_auto = $".."


func _on_body_entered(body):
	if body.is_in_group("players"):
		if body.shoot_next_timer.wait_time > 0.04:
			body.shoot_next_timer.set_wait_time(body.shoot_next_timer.wait_time - 0.02)
	#body.power_up_effect.show()
	#body.power_up_effect_2.show()
	#if body.power_up.is_stopped():
	#	body.power_up.start()
		
	full_auto.queue_free()
	
