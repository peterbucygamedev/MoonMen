extends Area2D
@onready var full_auto = $".."


func _on_body_entered(body):
	if body.is_in_group("players"):
		body.fullAuto = true
	body.power_up_effect.show()
	body.power_up_effect_2.show()
	if body.power_up.is_stopped():
		body.power_up.start()
		
	full_auto.queue_free()
	
