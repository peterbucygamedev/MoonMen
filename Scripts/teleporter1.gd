extends Area2D
@onready var t_2_marker_2d = $"../teleporter2/t2Marker2D"
var bullet = preload("res://Scenes/bullet.tscn")

func _on_body_entered(body):
	if body.is_in_group("players") and body.velocity.y >= 0:
		body.position = Vector2(t_2_marker_2d.global_position.x, t_2_marker_2d.global_position.y)
		
	"""if body.is_in_group("bullets"):
		body.queue_free()
		var b = bullet.instantiate()
		owner.add_child(b)
		b.audio_stream_player_2d.stop()
		b.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(t_2_marker_2d.global_position.x, t_2_marker_2d.global_position.y))
		b.apply_impulse(body.linear_velocity, Vector2(0,0))
		#b.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		b.timer.set_wait_time(1)"""
