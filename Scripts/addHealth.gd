extends Area2D
@onready var add_health_capacity = $".."

func _on_body_entered(body):
	if body.is_in_group("players"):
		body.health += 10
		body.maxHealth += 10
		body.health_bar.max_value += 10
		body.health_bar_2.max_value += 10
		body.power_up_effect.show()
		body.power_up_effect_2.show()
		if body.power_up.is_stopped():
			body.power_up.start()
		add_health_capacity.queue_free()

