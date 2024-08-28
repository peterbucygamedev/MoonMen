extends Area2D
@onready var left_area = $"../leftArea"
var bullet = preload("res://Scenes/bullet.tscn")
@onready var moon_slayer = $".."
const power_crate = preload("res://Scenes/power_crate.tscn")

func _on_body_entered(body):
	if body.is_in_group("players") and body.velocity.x >= 0:
		body.position = Vector2(left_area.position.x + 105, body.position.y)
		
	if body.is_in_group("bullets"):
		body.queue_free()
		var b = bullet.instantiate()
		moon_slayer.add_child(b)
		b.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(left_area.position.x + 105, body.position.y))
		b.apply_impulse(body.linear_velocity, Vector2(0,0))
		#b.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		
	if body.is_in_group("power_crate"):
		body.queue_free()
		var c = power_crate.instantiate()
		moon_slayer.add_child(c)
		c.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(left_area.position.x + 125, body.position.y))
		c.counter = body.counter
		#c.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		c.apply_impulse(body.linear_velocity, body.position)
