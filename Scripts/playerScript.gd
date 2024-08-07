extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var weapon = $weapon
@onready var sprite_2d = $weapon/Sprite2D
var bullet = preload("res://Scenes/bullet.tscn")
@onready var player = $"."


@export var playerNumber = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func shoot():
	var b = bullet.instantiate()
	player.owner.add_child(b)
	b.transform = $weapon.global_transform
	b.apply_impulse($weapon.transform.x * 1000, Vector2(0,0))

func _physics_process(delta):
	print($weapon.global_transform)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
		
	if Input.is_joy_button_pressed(playerNumber, 0) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#print("button pressed")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_joy_axis(playerNumber, 0)
	#if direction > 0.05 or direction < -0.05:
	#	velocity.x = direction * SPEED
		#print("go")
	
	if direction > 0.05:
		animated_sprite_2d.flip_h = false
		sprite_2d.flip_v = false
		velocity.x = direction * SPEED
		animated_sprite_2d.play("moving")
		
	elif direction < -0.05:
		animated_sprite_2d.flip_h = true
		sprite_2d.flip_v = true
		velocity.x = direction * SPEED
		animated_sprite_2d.play("moving")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#print("stop")
		animated_sprite_2d.play("idle")
	
	var joystick_horizontal = Input.get_joy_axis(playerNumber, 2)
	var joystick_vertical = Input.get_joy_axis(playerNumber, 3)
	$weapon.rotation = atan2(joystick_vertical, joystick_horizontal)
	#print(direction)
	

	
	
	move_and_slide()
	
