extends CharacterBody2D
var speed = 200
var orbNumber = 0
var ammoCost = 10
var damage = 5
@onready var area_2d = $Area2D


func _process(delta):
	var joystick_horizontal = Input.get_joy_axis(orbNumber, 2)
	var joystick_vertical = Input.get_joy_axis(orbNumber, 3)
	rotation = atan2(joystick_vertical, joystick_horizontal)
	print("horizontal", joystick_horizontal)
	print("vertical", joystick_vertical)
	
	if Input.get_joy_axis(orbNumber, 5):
		print("speed up")
		speed = 1000
	else:
		speed = 200
	
	velocity = Vector2(1,0).rotated(rotation) * speed
	print("velocity", velocity.y)
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("bullets"):
		queue_free()
		
	if body.is_in_group("players"):
		body.health -= damage
		body.health_bar.show()
		if body.health_bar_timer.is_stopped():
			body.health_bar_timer.start()
		queue_free()
		
	if body.is_in_group("shield"):
		print("hit shield")
		body.health -= damage
		queue_free()
