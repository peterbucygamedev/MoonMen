extends Area2D
@onready var top_area = $"../topArea"
@onready var collision_shape_2d = $"../topArea/CollisionShape2D"
var bullet = preload("res://Scenes/bullet.tscn")
@onready var moon_slayer = $".."
var WEAPON = preload("res://Scenes/weapon.tscn")
var laser = preload("res://Scenes/laser.tscn")
var teleportComplete = false
var restartPhysics = false

#var teleportPosition = Vector2(0,0)

func _on_body_entered(body):
	#print(collision_shape_2d.get_shape().get_rect())
	#check veloicty to ensure not to teleport back to quick
	if body.is_in_group("players") and body.velocity.y >= 0:
		#120 is just over half the width of collider, 
		#it is thick because players get going fast if the keep falling
		body.position = Vector2(body.position.x, top_area.position.y + 120)
		
	if body.is_in_group("bullets"):
		body.queue_free()
		var b = bullet.instantiate()
		moon_slayer.add_child(b)
		b.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(body.position.x, top_area.position.y + 120))
		b.apply_impulse(body.linear_velocity, body.position)
		
	if body.is_in_group("lasers"):
		#print("laser hit")
		"""if body.is_casting:
			var s = laser.instantiate()
			moon_slayer.add_child(s)
			s.is_casting
			s.transform = Transform2D(body.rotation, body.scale, body.skew, Vector2(body.position.x, top_area.position.y + 120))"""

#safety
"""func _on_body_exited(body):
	if body.is_in_group("players") and body.position.y >= 350:
		body.position = Vector2(body.position.x,top_area.position.y + 100)"""
		
		

