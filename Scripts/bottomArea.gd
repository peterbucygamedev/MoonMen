extends Area2D
@onready var top_area = $"../topArea"
@onready var collision_shape_2d = $"../topArea/CollisionShape2D"
var bullet = preload("res://Scenes/pickUps/bullet.tscn")
@onready var moon_slayer = $".."
var WEAPON = preload("res://Scenes/weapon.tscn")
#var laser = preload("res://Scenes/laser.tscn")
var teleportComplete = false
var restartPhysics = false
const power_crate = preload("res://Scenes/power_crate.tscn")
#var teleportPosition = Vector2(0,0)

func _on_body_entered(body):
	if body.is_in_group("players") and body.velocity.y >= 0:
		print("entered")
		body.position = Vector2(body.position.x, top_area.position.y + 120)
		
	if body.is_in_group("remoteBullets") and body.velocity.y >= 0:
		print("entered")
		body.position = Vector2(body.position.x, top_area.position.y + 120)
		
		
	if body.is_in_group("bullets") and body.linear_velocity.y >= 0:
		body.queue_free()
		var b = GameManager.bullets[body.tracker].instantiate()
		moon_slayer.add_child(b)
		b.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(body.position.x, top_area.position.y + 120))
		b.apply_impulse(body.linear_velocity, Vector2(0,0))
		#b.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		b.timer.set_wait_time(1)

		
	if body.is_in_group("power_crate") and body.linear_velocity.y >= 0:
		body.queue_free()
		var c = power_crate.instantiate()
		moon_slayer.add_child(c)
		c.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(body.position.x, top_area.position.y + 140))
		c.counter = body.counter
		#c.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		c.apply_impulse(body.linear_velocity, body.position)
#safety
"""func _on_body_exited(body):
	if body.is_in_group("players") and body.position.y >= 350:
		body.position = Vector2(body.position.x,top_area.position.y + 100)"""
		
		
