extends RigidBody2D

func _process(delta):
	var joystick_horizontal = Input.get_joy_axis(0, 2)
	var joystick_vertical = Input.get_joy_axis(0, 3)
	rotation = atan2(joystick_vertical, joystick_horizontal)
