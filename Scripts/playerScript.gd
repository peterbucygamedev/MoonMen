extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var weapon = $weapon
@onready var sprite_2d = $weapon/Sprite2D
@onready var player = $"."
@onready var bullet_spawn = $weapon/bulletSpawn
@export var playerNumber = 0
@onready var player_collision = $playerCollision
@onready var player_1_timer = $timers/player1Timer
@onready var player_2_timer = $timers/player2Timer
@onready var player_3_timer = $timers/player3Timer
@onready var player_4_timer = $timers/player4Timer
@onready var health_bar_timer = $timers/healthBarTimer
@onready var full_auto_timer = $timers/fullAutoTimer
@onready var health_timer = $timers/healthTimer
@onready var shield_timer = $timers/shieldTimer
@onready var power_crate_timer = $timers/powerCrateTimer
@onready var shoot_next_timer = $timers/shootNextTimer
@onready var acid_timer = $timers/acidTimer

@onready var power_up = $timers/powerUp
@onready var reload_timer = $timers/reloadTimer
@onready var health_bar = $progressbars/healthBar
@onready var health_bar_2 = $progressbars/healthBar2
@onready var ammo_bar = $progressbars/ammoBar
@onready var laser = $weapon/laser
@onready var energy_shield = $energyShield
@onready var weapon_sprite = $weapon/weaponSprite
@onready var reload = $reload
@onready var laser_beam_sfx = $laserBeamSFX
@onready var power_up_sfx = $powerUpSFX
@onready var power_up_effect = $powerUpEffect
@onready var power_up_effect_2 = $powerUpEffect2
@onready var lives_number = $livesNumber



var bullet := preload("res://Scenes/bullet.tscn")

var SPEED := 200
#-450
var JUMP_VELOCITY := -450
#-750
var health := 10
var maxHealth = 10
var jumpCounter := 0
var lastHealth := health
var lives := 3
var ammo = 10
var maxAmmo = 10
var damage = 1
var p1BulletSpeed = 1000
var p2BulletSpeed = 1000
var p3BulletSpeed = 1000
var p4BulletSpeed = 1000
var p1Damage = 1
var p2Damage = 1
var p3Damage = 1
var p4Damage = 1
var p1Ammo = 10
var p2Ammo = 10
var p3Ammo = 10
var p4Ammo = 10
var p1MaxAmmo = 10
var p2MaxAmmo = 10
var p3MaxAmmo = 10
var p4MaxAmmo = 10


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var startingTransform = transform

var select := false
var crouching := false
var secondary := false
var fullAuto := false
var explosion := false
var is_touching_wall := false
var mouseAim := false
var shieldDamage := true
var powerCrateDamage := true
var dead := false
var addBulletSpeed := false
var burst = false
var shootNext := true
var burstNext := true

var burstCounter := 0

func _ready() -> void:
	pass
	reload.hide()
	health_bar.hide()
	energy_shield.hide()
	energy_shield.get_node("energyShieldCollider").disabled = true
	if playerNumber == 0:
		weapon_sprite.play("weaponGrey")
		health = GameManager.player1Health
		p1BulletSpeed = GameManager.player1BulletSpeed
		p1Damage = GameManager.player1Damage
		p1Ammo = GameManager.player1Ammo
		p1MaxAmmo = GameManager.player1MaxAmmo
	if playerNumber == 1:
		weapon_sprite.play("weaponPink")
		health = GameManager.player2Health
		p2BulletSpeed = GameManager.player2BulletSpeed
		p2Damage = GameManager.player2Damage
		p2Ammo = GameManager.player2Ammo
		p2MaxAmmo = GameManager.player2MaxAmmo
	if playerNumber == 2:
		weapon_sprite.play("weaponGreen")
		health = GameManager.player3Health
		p3BulletSpeed = GameManager.player3BulletSpeed
		p3Damage = GameManager.player3Damage
		p3Ammo = GameManager.player3Ammo
		p3MaxAmmo = GameManager.player3MaxAmmo
	if playerNumber == 3:
		weapon_sprite.play("weaponBlue")
		health = GameManager.player4Health
		p4BulletSpeed = GameManager.player4BulletSpeed
		p4Damage = GameManager.player4Damage
		p4Ammo = GameManager.player4Ammo
		p4MaxAmmo = GameManager.player4MaxAmmo
	energy_shield.shieldNumber = playerNumber

	
func shoot() -> void:
	
	"""if ammo > 0:
		var b = bullet.instantiate()
		ammo -= 1
		b.speed = bulletSpeed
		b.damage = damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
		
	elif ammo <= 0 and reload_timer.is_stopped():
		reload_timer.start()
		reload.show()"""
	#var b = bullet.instantiate()
	if playerNumber == 0 and p1Ammo> 0:
		var b1 = bullet.instantiate()
		p1Ammo -= 1
		b1.speed = p1BulletSpeed
		b1.damage = p1Damage
		player.owner.add_child(b1)
		b1.transform = bullet_spawn.global_transform
		b1.apply_impulse(weapon.transform.x * b1.speed, Vector2(0,0))
	
	elif p1Ammo <= 0 and player_1_timer.is_stopped() and playerNumber == 0:
		player_1_timer.start()
		reload.show()
		
	if playerNumber == 1 and p2Ammo > 0:
		var b2 = bullet.instantiate()
		p2Ammo -= 1
		b2.speed = p2BulletSpeed
		b2.damage = p2Damage
		player.owner.add_child(b2)
		b2.transform = bullet_spawn.global_transform
		b2.apply_impulse(weapon.transform.x * b2.speed, Vector2(0,0))
		
	elif p2Ammo <= 0 and player_2_timer.is_stopped() and playerNumber == 1:
		player_2_timer.start()
		reload.show()
		
	if playerNumber == 2 and p3Ammo > 0:
		var b3 = bullet.instantiate()
		p3Ammo -= 1
		b3.speed = p3BulletSpeed
		b3.damage = p3Damage
		player.owner.add_child(b3)
		b3.transform = bullet_spawn.global_transform
		b3.apply_impulse(weapon.transform.x * b3.speed, Vector2(0,0))
	
	elif p3Ammo <= 0 and player_3_timer.is_stopped() and playerNumber == 2:
		player_3_timer.start()
		reload.show()
		
	if playerNumber == 3 and p4Ammo > 0:
		var b4 = bullet.instantiate()
		p4Ammo -= 1
		b4.speed = p4BulletSpeed
		b4.damage = p4Damage
		player.owner.add_child(b4)
		b4.transform = bullet_spawn.global_transform
		b4.apply_impulse(weapon.transform.x * b4.speed, Vector2(0,0))
		
	elif p4Ammo <= 0 and player_4_timer.is_stopped() and playerNumber == 3:
		player_4_timer.start()
		reload.show()

		
func _process(delta) -> void:
	
	lives_number.text = str(lives)
	#print(is_touching_wall)
	health_bar.value = health
	health_bar_2.value = health
	
	if playerNumber == 0:
		ammo_bar.value = p1Ammo
		
	if playerNumber == 1:
		ammo_bar.value = p2Ammo
		
	if playerNumber == 2:
		ammo_bar.value = p3Ammo
		
	if playerNumber == 3:
		ammo_bar.value = p4Ammo
	#reload.play()
	#print(playerDamage)
	#print(health)
	#print(position)
	#print(velocity)	
	
	if fullAuto:
		shoot_next_timer.set_wait_time(0.05)
		
	if !fullAuto:
		shoot_next_timer.set_wait_time(0.2)
		
	if health <= 0:
		GameManager.deaths += 1
		dead = true
		if dead:
			lives -= 1
			transform = startingTransform
		if lives > 0:
			dead = false
			health = maxHealth
		if lives <= 0:
			GameManager.numberOfPlayers -= 1
			queue_free()
		
		#print("you died")
		
			
	if Input.is_action_just_pressed("toggleAim") :
		mouseAim = !mouseAim
		
	if energy_shield.shieldEnabled == false:
		energy_shield.hide()
		energy_shield.get_node("energyShieldCollider").disabled = true
		
	if energy_shield.shieldEnabled == true and crouching == true:
		energy_shield.show()
		energy_shield.get_node("energyShieldCollider").disabled = false
		
	
	if Input.is_joy_button_pressed(playerNumber, 9):
			crouching = true
			if playerNumber == 0 and crouching:
				animated_sprite_2d.play("slideGrey")
			if playerNumber == 1:
				animated_sprite_2d.play("slidePink")
			if playerNumber == 2:
				animated_sprite_2d.play("slideGreen")
			if playerNumber == 3:
				animated_sprite_2d.play("slideBlue")

			
	elif !Input.is_joy_button_pressed(playerNumber, 9):
		crouching = false
		energy_shield.get_node("energyShieldCollider").disabled = true
		energy_shield.hide()
		
		
	if Input.is_joy_button_pressed(playerNumber, 10) or Input.is_action_pressed("shootLaser"):
		laser.is_casting = true
		if !laser_beam_sfx.playing:
			laser_beam_sfx.play()
		if laser.is_colliding() and laser.get_collider() != null:
			if laser.get_collider().is_in_group("players"):
				#print("hit player")
				if health_timer.is_stopped():
					health_timer.start()
					
			
	else:
		laser.is_casting = false
		laser_beam_sfx.stop()
		
	if crouching == true and energy_shield.shieldEnabled:
		energy_shield.show()
		
	if Input.get_joy_axis(playerNumber, 5):
		if shootNext:
			shoot()
			shootNext = false
			if shoot_next_timer.is_stopped():
				shoot_next_timer.start()
				
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if not is_on_floor() and not is_touching_wall:
		jumpCounter = 0
		

		
	if Input.is_joy_button_pressed(playerNumber, 0) and (is_on_floor() or is_touching_wall) and jumpCounter < 1:
		velocity.y = JUMP_VELOCITY
		jumpCounter += 1
		#print("button pressed")
		


	var direction = Input.get_joy_axis(playerNumber, 0)
	var direction2 = Input.get_axis("keyboardLeft", "keyboardRight")
	
	
	if (direction > 0.05 or direction2 > 0.05) and crouching == false:
		animated_sprite_2d.flip_h = false
		energy_shield.position.x = 14
		energy_shield.scale.x = 1
		#energy_shield.energy_sprite.flip_h = false
		#health_outline.flip_h = false
		sprite_2d.flip_v = false
		weapon_sprite.flip_v = false
		velocity.x = direction * SPEED
		if playerNumber == 0:
			animated_sprite_2d.play("movingGrey")
		if playerNumber == 1:
			animated_sprite_2d.play("movingPink")
		if playerNumber == 2:
			animated_sprite_2d.play("movingGreen")
		if playerNumber == 3:
			animated_sprite_2d.play("movingBlue")
		
	elif (direction < -0.05 or direction2 < -0.05) and crouching == false:
		animated_sprite_2d.flip_h = true
		energy_shield.position.x = -14
		energy_shield.scale.x = -1
		#energy_shield.energy_sprite.flip_h = true
		#health_outline.flip_h = true
		sprite_2d.flip_v = true
		weapon_sprite.flip_v = true
		velocity.x = direction * SPEED
		if playerNumber == 0:
			animated_sprite_2d.play("movingGrey")
		if playerNumber == 1:
			animated_sprite_2d.play("movingPink")
		if playerNumber == 2:
			animated_sprite_2d.play("movingGreen")
		if playerNumber == 3:
			animated_sprite_2d.play("movingBlue")
		
	elif crouching == false:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#print("stop")
		if playerNumber == 0:
			animated_sprite_2d.play("idleGrey")
		if playerNumber == 1:
			animated_sprite_2d.play("idlePink")
		if playerNumber == 2:
			animated_sprite_2d.play("idleGreen")
		if playerNumber == 3:
			animated_sprite_2d.play("idleBlue")
		
	#if explosion == true:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	var joystick_horizontal = Input.get_joy_axis(playerNumber, 2)
	var joystick_vertical = Input.get_joy_axis(playerNumber, 3)
	if  !mouseAim:
		$weapon.rotation = atan2(joystick_vertical, joystick_horizontal)
	elif mouseAim:
		$weapon.look_at(get_global_mouse_position())
	
	if laser.is_casting:
		if laser.get_collider() != null and laser.get_collider().is_in_group("shield"):
			if laser.get_collider().shieldNumber != playerNumber and shieldDamage:
				laser.get_collider().health -= 2
				shieldDamage = false
				if shield_timer.is_stopped():
					shield_timer.start()
				#print("hit shield")
		
	if laser.is_casting:
		if laser.get_collider() != null and laser.get_collider().is_in_group("power_crate"):
			laser.get_collider().counter += 1
			powerCrateDamage = false
			if power_crate_timer.is_stopped():
				power_crate_timer.start()
			#print("hit power crate")

	move_and_slide()
	#move_and_collide(velocity * delta)
	
"""func _on_reload_timer_timeout():
	ammo = maxAmmo
	reload.hide()"""

func _on_player_1_timer_timeout() -> void:
	#print("player1Reloaded")
	p1Ammo = p1MaxAmmo
	reload.hide()

func _on_player_2_timer_timeout()-> void:
	p2Ammo = p2MaxAmmo
	reload.hide()

func _on_player_3_timer_timeout()-> void:
	p3Ammo = p3MaxAmmo
	reload.hide()

func _on_player_4_timer_timeout()-> void:
	p4Ammo = p4MaxAmmo
	reload.hide()


func _on_health_bar_timer_timeout()-> void:
	#print("hide health")
	health_bar.hide()


func _on_full_auto_timeout()-> void:
	fullAuto = false


func _on_area_2d_body_entered(body)-> void:
	if body.is_in_group("wall"):
		is_touching_wall = true
		
	if body.is_in_group("acid"):
		print("in acid")
		if acid_timer.is_stopped():
			acid_timer.start()
			
func _on_area_2d_body_exited(body)-> void:
	if body.is_in_group("wall"):
		is_touching_wall = false
		jumpCounter = 0
	
	if body.is_in_group("acid"):
			acid_timer.stop()


func _on_health_timer_timeout()-> void:
	if laser.is_casting:
		if laser.get_collider() != null and laser.get_collider().is_in_group("players"):
			laser.get_collider().health -= 1
			laser.get_collider().health_bar.show()
			#print("hit player")
			health_bar_timer.start()
		
	
func _on_shield_timer_timeout()-> void:
	shieldDamage = true

func _on_power_crate_timer_timeout()-> void:
	powerCrateDamage = true

func _on_shoot_next_timer_timeout():
	shootNext = true



func _on_power_up_timeout():
	power_up_effect.hide()
	power_up_effect_2.hide()
	power_up_effect.restart()
	power_up_effect_2.restart()
	

func _on_acid_timer_timeout():
	print("acid damage")
	health -= 2
	health_bar.show()
	health_bar_timer.start()
