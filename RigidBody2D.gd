extends RigidBody2D
@onready var jump_timer = $"../jumpTimer"
var rng = RandomNumberGenerator.new()
var random_number = 0
@onready var rigid_body_2d = $"."


func _process(delta):
	if jump_timer.is_stopped():
		jump_timer.start()
	random_number = rng.randf_range(-10.0, 10.0)

func _on_jump_timer_timeout():
	print("jumping")
	#apply_impulse(Vector2(0,-100), Vector2(0,0))
	apply_central_impulse(Vector2(rigid_body_2d.rotation, rigid_body_2d.rotation) * -200)
