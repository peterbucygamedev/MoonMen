extends Area2D
@onready var bottom_area = $"../bottomArea"
var bullet = preload("res://Scenes/bullet.tscn")
@onready var moon_slayer = $".."
const power_crate = preload("res://Scenes/power_crate.tscn")


func _on_body_entered(body):
	if body.is_in_group("players") and body.velocity.y <= 0:
		body.position = Vector2(body.position.x, bottom_area.position.y - 120)
		
	if body.is_in_group("bullets") and body.linear_velocity.y <= 0:
		body.queue_free()
		var b = GameManager.bullets[body.tracker].instantiate()
		moon_slayer.add_child(b)
		b.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(body.position.x, bottom_area.position.y - 120))
		b.apply_impulse(body.linear_velocity, Vector2(0,0))
		#b.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		
	if body.is_in_group("power_crate") and body.linear_velocity.y <= 0:
		body.queue_free()
		var c = power_crate.instantiate()
		moon_slayer.add_child(c)
		c.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(body.position.x, bottom_area.position.y - 140))
		c.counter = body.counter
		#c.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		c.apply_impulse(body.linear_velocity, body.position)
"""func _on_body_exited(body):
	if body.is_in_group("players") and body.velocity.y <= 0:
		body.position = Vector2(body.position.x, bottom_area.position.y - 100)"""



