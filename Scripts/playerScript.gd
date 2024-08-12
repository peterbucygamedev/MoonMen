extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var weapon = $weapon
@onready var sprite_2d = $weapon/Sprite2D
var bullet = preload("res://Scenes/bullet.tscn")
@onready var player = $"."
var health = 100
var lastHealth = health
@onready var healthBar = $health
@onready var health_outline = $health/healthOutline
@onready var bullet_spawn = $weapon/bulletSpawn
@export var playerNumber = 0
var select = false
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	healthBar.play("100")
	pass

	
func shoot():
	var b = bullet.instantiate()
	audio_stream_player_2d.play()
	if playerNumber == 0:
		b.speed = GameManager.player1Speed
		print("current bulletSpeed for player", playerNumber, " is ", b.speed)
		b.damage = GameManager.player1Damage
		b.set_inertia(1000)
		b.gravity_scale = 1
		b.center_of_mass_mode = 1
		b.center_of_mass = Vector2(0, 0.1)
		
	if playerNumber == 1:
		b.speed = GameManager.player2Speed
		print("current bulletSpeed for player", playerNumber, " is ", b.speed)
		b.damage = GameManager.player2Damage
		b.set_inertia(1000)
		b.gravity_scale = 1
		b.center_of_mass_mode = 1
		b.center_of_mass = Vector2(0, 0.1)
		
	if playerNumber == 2:
		b.speed = GameManager.player3Speed
		print("current bulletSpeed for player", playerNumber, " is ", b.speed)
		b.damage = GameManager.player3Damage
		b.set_inertia(1000)
		b.gravity_scale = 1
		b.center_of_mass_mode = 1
		b.center_of_mass = Vector2(0, 0.1)
		
	if playerNumber == 3:
		b.speed = GameManager.player4Speed
		print("current bulletSpeed for player", playerNumber, " is ", b.speed)
		b.damage = GameManager.player4Damage
		b.set_inertia(1000)
		b.gravity_scale = 1
		b.center_of_mass_mode = 1
		b.center_of_mass = Vector2(0, 0.1)
		
		
	player.owner.add_child(b)
	b.transform = bullet_spawn.global_transform
	b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
	
	#add_collision_exception_with(b)
	#$weapon.add_collision_exception_with(b)

	
func _physics_process(delta):
	
	#print(playerDamage)
	#print(health)
	health_outline.play("scan")

			
	if health <= 0:
		GameManager.deaths += 1
		#print("you died")
		process_mode = Node.PROCESS_MODE_DISABLED
		hide()
		
		
	if health <= 10 and health < lastHealth:
		healthBar.play("10")
		lastHealth = health

	if health > 10 and health <= 20 and health < lastHealth:
		healthBar.play("20")
		health_outline.play("scan")
		lastHealth = health

	if health > 20 and health <= 30 and health < lastHealth:
		healthBar.play("30")
		lastHealth = health

	if health > 30 and health <= 40 and health < lastHealth:
		healthBar.play("40")
		lastHealth = health

	if health > 40 and health <= 50 and health < lastHealth:
		healthBar.play("50")
		lastHealth = health

	if health > 50 and health <= 60 and health < lastHealth:
		healthBar.play("60")
		lastHealth = health

	if health > 60 and health <= 70 and health < lastHealth:
		healthBar.play("70")
		lastHealth = health

	if health > 70 and health <= 80 and health < lastHealth:
		healthBar.play("80")
		lastHealth = health

	if health > 80 and health <= 90 and health < lastHealth:
		healthBar.play("90")
		lastHealth = health

	if health > 90 and health <= 100 and health < lastHealth:
		healthBar.play("100")
			
	
	
	
	
	if Input.get_joy_axis(playerNumber, 5):
		
		if Input.is_action_just_pressed("shoot"):
			shoot()
			select = true
			
		if Input.is_action_just_released("shoot"):
			select = false
		
	print(select)
	
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
	



		



