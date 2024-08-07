extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var weapon = $weapon
@onready var sprite_2d = $weapon/Sprite2D
var bullet = preload("res://Scenes/bullet.tscn")
@onready var player = $"."
var health = 20
@onready var healthBar = $health
@export var playerNumber = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")




func shoot():
	var b = bullet.instantiate()
	player.owner.add_child(b)
	b.transform = $weapon.global_transform
	b.apply_impulse($weapon.transform.x * 750, Vector2(0,0))
	add_collision_exception_with(b)
	$weapon.add_collision_exception_with(b)
	
	
func _physics_process(delta):
	
	if Input.get_joy_axis(playerNumber, 5):
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
		
	if health <= 0:
		#print("you died")
		pass
		
	if health <= 10:
		healthBar.play("health 10")
		
	if health > 10 and health <= 20:
		healthBar.play("health 20")
		
	if health > 20 and health <= 30:
		healthBar.play("health 30")
		
	if health > 30 and health <= 40:
		healthBar.play("health 40")
		
	if health > 40 and health <= 50:
		healthBar.play("health 50")
		
	if health > 50 and health <= 60:
		healthBar.play("health 60")
		
	if health > 60 and health <= 70:
		healthBar.play("health 70")
		
	if health > 70 and health <= 80:
		healthBar.play("health 80")
		
	if health > 80 and health <= 90:
		healthBar.play("health 90")
		
	if health > 90 and health <= 100:
		healthBar.play("health 100")
	
	var joystick_horizontal = Input.get_joy_axis(playerNumber, 2)
	var joystick_vertical = Input.get_joy_axis(playerNumber, 3)
	$weapon.rotation = atan2(joystick_vertical, joystick_horizontal)
	#print(direction)
	

	
	
	move_and_slide()
	
