extends Area2D
var damage = 1
var knockback_modifier = 10
func explode():
	for body in get_overlapping_bodies():
		if body is RigidBody2D:
			var force = (body.global_position - global_position).normalized()
			force *= 200
			body.apply_central_impulse(force)
			
		if body.is_in_group("players"):
		#print("hit player")
		
			body.health -= damage
			body.health_bar.show()
			if body.health_bar_timer.is_stopped():
				body.health_bar_timer.start()
	
