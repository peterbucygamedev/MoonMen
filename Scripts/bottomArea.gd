extends Area2D
@onready var top_area = $"../topArea"
@onready var collision_shape_2d = $"../topArea/CollisionShape2D"
var bullet = preload("res://Scenes/bullet.tscn")
@onready var moon_slayer = $".."
var WEAPON = preload("res://Scenes/weapon.tscn")
#var laser = preload("res://Scenes/laser.tscn")
var teleportComplete = false
var restartPhysics = false
const power_crate = preload("res://Scenes/power_crate.tscn")
#var teleportPosition = Vector2(0,0)

func _on_body_entered(body):
	#print(collision_shape_2d.get_shape().get_rect())
	#check veloicty to ensure not to teleport back to quick
	if body.is_in_group("players") and body.velocity.y >= 0:
		#120 is just over half the width of collider, 
		#it is thick because players get going fast if the keep falling
		body.position = Vector2(body.position.x, top_area.position.y + 120)
		
	if body.is_in_group("bullets"):
		#body.queue_free()
		var b = bullet.instantiate()
		moon_slayer.add_child(b)
		b.audio_stream_player_2d.stop()
		b.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(body.position.x, top_area.position.y + 120))
		b.apply_impulse(body.linear_velocity, Vector2(0,0))
		#b.apply_impulse(body.transform.x * body.speed, Vector2(0,0))
		b.timer.set_wait_time(1)
		
	if body.is_in_group("power_crate"):
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
		
		