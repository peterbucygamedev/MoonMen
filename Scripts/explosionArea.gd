extends Area2D
@onready var explosion_collider = $explosionCollider

func explode():
	print("exploded")
	for body in get_overlapping_bodies():
		if body is RigidBody2D:
			print("found rigidBody")
			var force = (body.global_position - global_position).normalized()
			force *= 1000
			body.apply_central_impulse(force)
			
		if body.is_in_group("players"):
			print("found player")
			body.health -= 10
			body.health_bar.show()
			if body.health_bar_timer.is_stopped():
				body.health_bar_timer.start()
	
