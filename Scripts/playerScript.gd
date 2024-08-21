extends CharacterBody2D
var SPEED = 300.0
var JUMP_VELOCITY = -750
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var weapon = $weapon
@onready var sprite_2d = $weapon/Sprite2D
var bullet = preload("res://Scenes/bullet.tscn")
var saw_blade = preload("res://Scenes/saw_blade.tscn")
@onready var player = $"."
var health = 10
var lastHealth = health
@onready var bullet_spawn = $weapon/bulletSpawn
@export var playerNumber = 0
var select = false
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
var crouching = false
@onready var player_collision = $playerCollision
@onready var player_1_timer = $player1Timer
@onready var player_2_timer = $player2Timer
@onready var player_3_timer = $player3Timer
@onready var player_4_timer = $player4Timer
@onready var reload = $reload
@onready var health_bar = $healthBar
@onready var health_bar_timer = $healthBarTimer
@onready var health_bar_2 = $healthBar2
var secondary = false
var burst = false
@onready var burst_timer = $burstTimer
var explosion = false
var is_touching_wall = false
var jumpCounter = 0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass
	reload.hide()
	health_bar.hide()

	
func shoot():
	#var b = bullet.instantiate()
	if playerNumber == 0 and GameManager.player1Ammo > 0:
		audio_stream_player_2d.play()
		var b = bullet.instantiate()
		#b.speed = GameManager.player1Speed
		b.damage = GameManager.player1Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
	
	elif GameManager.player1Ammo <= 0 and player_1_timer.is_stopped():
		player_1_timer.start()
		reload.show()
		
	if playerNumber == 1 and GameManager.player2Ammo > 0:
		audio_stream_player_2d.play()
		var b = bullet.instantiate()
		GameManager.player2Ammo -= 1
		b.speed = GameManager.player2Speed
		b.damage = GameManager.player2Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
		
	elif GameManager.player2Ammo <= 0 and player_2_timer.is_stopped():
		player_2_timer.start()
		reload.show()
		
	if playerNumber == 2 and GameManager.player3Ammo > 0:
		audio_stream_player_2d.play()
		var b = bullet.instantiate()
		GameManager.player3Ammo -= 1
		b.speed = GameManager.player3Speed
		b.damage = GameManager.player3Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
	
	elif GameManager.player3Ammo <= 0 and player_3_timer.is_stopped():
		player_3_timer.start()
		reload.show()
		
	if playerNumber == 3 and GameManager.player4Ammo > 0:
		audio_stream_player_2d.play()
		var b = bullet.instantiate()
		GameManager.player4Ammo -= 1
		b.speed = GameManager.player4Speed
		b.damage = GameManager.player4Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
		
	elif GameManager.player4Ammo <= 0 and player_4_timer.is_stopped():
		player_4_timer.start()
		reload.show()
		
		
	"""player.owner.add_child(b)
	b.transform = bullet_spawn.global_transform
	b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))"""
	
	#add_collision_exception_with(b)
	#$weapon.add_collision_exception_with(b)
func shootSecondary():
	#var b = bullet.instantiate()
	if playerNumber == 0 and GameManager.player1Ammo > 0:
		audio_stream_player_2d.play()
		var b = saw_blade.instantiate()
		GameManager.player1Ammo -= 1
		b.speed = GameManager.player1Speed
		b.damage = GameManager.player1Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
	
	elif GameManager.player1Ammo <= 0 and player_1_timer.is_stopped():
		player_1_timer.start()
		reload.show()
		
	if playerNumber == 1 and GameManager.player2Ammo > 0:
		audio_stream_player_2d.play()
		var b = saw_blade.instantiate()
		GameManager.player2Ammo -= 1
		b.speed = GameManager.player2Speed
		b.damage = GameManager.player2Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
		
	elif GameManager.player2Ammo <= 0 and player_2_timer.is_stopped():
		player_2_timer.start()
		
	if playerNumber == 2 and GameManager.player3Ammo > 0:
		audio_stream_player_2d.play()
		var b = saw_blade.instantiate()
		GameManager.player3Ammo -= 1
		b.speed = GameManager.player3Speed
		b.damage = GameManager.player3Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
	
	elif GameManager.player3Ammo <= 0 and player_3_timer.is_stopped():
		player_3_timer.start()
		
	if playerNumber == 3 and GameManager.player4Ammo > 0:
		audio_stream_player_2d.play()
		var b = saw_blade.instantiate()
		GameManager.player4Ammo -= 1
		b.speed = GameManager.player4Speed
		b.damage = GameManager.player4Damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
		
	elif GameManager.player4Ammo <= 0 and player_4_timer.is_stopped():
		player_4_timer.start()
	
func _physics_process(delta):
	
	print(is_touching_wall)
	health_bar.value = health
	health_bar_2.value = health
	#reload.play()
	#print(playerDamage)
	#print(health)
	#print(position)
	#print(velocity)	
	if health <= 0:
		GameManager.deaths += 1
		#print("you died")
		process_mode = Node.PROCESS_MODE_DISABLED
		hide()
			
	
	if Input.is_joy_button_pressed(playerNumber, 9):
		if Input.is_action_just_pressed("slide"):
			animated_sprite_2d.play("slide")
			crouching = true
	else:
		crouching = false
		
	if Input.get_joy_axis(playerNumber, 5):
		if burst:
			if !secondary:
				shoot()
			if secondary:
				shootSecondary()
			if burst_timer.is_stopped():
				burst_timer.start()
				
		elif !burst and Input.is_action_just_pressed("shoot"):
			if !secondary:
				shoot()
			if secondary:
				shootSecondary()
			select = true
			
		if Input.is_action_just_released("shoot"):
			select = false
			
	if Input.is_joy_button_pressed(playerNumber, 10):
		if Input.is_action_just_pressed("shoot_secondary"):
			secondary = !secondary
			#shootSecondary()
	
	

		
	#print(select)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if not is_on_floor() and not is_touching_wall:
		jumpCounter = 0
		
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
		
	if Input.is_joy_button_pressed(playerNumber, 0) and (is_on_floor() or is_touching_wall) and jumpCounter < 1:
		velocity.y = JUMP_VELOCITY
		jumpCounter += 1
		#print("button pressed")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_joy_axis(playerNumber, 0)
	#if direction > 0.05 or direction < -0.05:
	#	velocity.x = direction * SPEED
		#print("go")
	var direction = Input.get_joy_axis(playerNumber, 0)
	
	
	
	if direction > 0.05 and crouching == false:
		animated_sprite_2d.flip_h = false
		#health_outline.flip_h = false
		sprite_2d.flip_v = false
		velocity.x = direction * SPEED
		animated_sprite_2d.play("moving")
		
	elif direction < -0.05 and crouching == false:
		animated_sprite_2d.flip_h = true
		#health_outline.flip_h = true
		sprite_2d.flip_v = true
		velocity.x = direction * SPEED
		animated_sprite_2d.play("moving")
		
	elif crouching == false:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#print("stop")
		animated_sprite_2d.play("idle")
		
	if explosion == true:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	
	var joystick_horizontal = Input.get_joy_axis(playerNumber, 2)
	var joystick_vertical = Input.get_joy_axis(playerNumber, 3)
	$weapon.rotation = atan2(joystick_vertical, joystick_horizontal)
	#print(direction)

	move_and_slide()
	
func _on_player_1_timer_timeout():
	#print("player1Reloaded")
	GameManager.player1Ammo = 10
	reload.hide()

func _on_player_2_timer_timeout():
	GameManager.player2Ammo = 10
	reload.hide()

func _on_player_3_timer_timeout():
	GameManager.player3Ammo = 10
	reload.hide()

func _on_player_4_timer_timeout():
	GameManager.player4Ammo = 10
	reload.hide()


func _on_health_bar_timer_timeout():
	#print("hide health")
	health_bar.hide()


func _on_burst_timer_timeout():
	burst = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("wall"):
		is_touching_wall = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("wall"):
		is_touching_wall = false
		jumpCounter = 0
