extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var weapon = $weapon
@onready var sprite_2d = $weapon/Sprite2D
@onready var player = $"."
@onready var bullet_spawn = $weapon/bulletSpawn
@export var playerNumber = 0
@onready var player_collision = $playerCollision
@onready var player_timer = $timers/playerTimer
@onready var health_bar_timer = $timers/healthBarTimer
@onready var health_timer = $timers/healthTimer
@onready var shield_timer = $timers/shieldTimer
@onready var power_crate_timer = $timers/powerCrateTimer
@onready var shoot_next_timer = $timers/shootNextTimer
@onready var acid_timer = $timers/acidTimer
@onready var death_lasers_timer = $timers/deathLasersTimer
@onready var reload_timer = $timers/reloadTimer
@onready var power_up = $timers/powerUp
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
@onready var bullet_sfx = $bulletSFX

#var bouncers = preload("res://Scenes/bouncers.tscn")
#var bullet := preload("res://Scenes/bullet.tscn")

var SPEED := 200
#-450
var JUMP_VELOCITY := -450
#-750
var health := 10
var maxHealth = 10
var jumpCounter := 0
var lastHealth := health
var lives := 3
var damage = 1
var ammo = 10
var maxAmmo = 10
var bulletSpeed = 750
#var laser2 = null


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var startingTransform = transform

var select := false
var crouching := false
var secondary := false
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
var bulletTracker := 0
var orbArray := []
var color1 := Color(1,1,1)
var color2 := Color(1,0,1)
var color3 := Color(0,1,1)
var color4 := Color(0,1,0)
var playerColor = color1

func _ready() -> void:
	reload.hide()
	health_bar.hide()
	energy_shield.hide()
	energy_shield.get_node("energyShieldCollider").disabled = true
	if playerNumber == 0:
		pass
	if playerNumber == 1:
		animated_sprite_2d.modulate = color2
		weapon.modulate = color2
		energy_shield.modulate = color2
		playerColor = color2

	if playerNumber == 2:
		animated_sprite_2d.modulate = color3
		weapon.modulate = color3
		energy_shield.modulate = color3
		playerColor = color3

	if playerNumber == 3:
		animated_sprite_2d.modulate = color4
		weapon.modulate = color4
		energy_shield.modulate = color4
		playerColor = color4

	energy_shield.shieldNumber = playerNumber

func shoot() -> void:
	if ammo > 0:
		var b = GameManager.bullets[bulletTracker].instantiate()
		b.modulate = playerColor
		if bulletTracker == 3:
			b.orbNumber = playerNumber
			print("does equal")
			orbArray.append(b)
			b.playerControlling.append(player)
		if bulletTracker == 4:
			b.playerStealing.append(player)
		bullet_sfx.play()
		ammo -= b.ammoCost
		b.speed += bulletSpeed
		b.damage *= damage
		player.owner.add_child(b)
		b.transform = bullet_spawn.global_transform
		if bulletTracker != 3:
			print("doesn't equal")
			b.apply_impulse(weapon.transform.x * b.speed, Vector2(0,0))
	
func _process(delta) -> void:
	

	lives_number.text = str(lives)
	health_bar.value = health
	health_bar_2.value = health
	
	if ammo <= 0 and player_timer.is_stopped():
		if bulletTracker != 3:
			player_timer.start()
			reload.show()
		if bulletTracker == 3 and orbArray.is_empty():
			player_timer.start()
			reload.show()
	
	ammo_bar.value = ammo
	print("orbArray", orbArray)
	
	if health <= 0:
		if !orbArray.is_empty():
			var orb = orbArray.pop_at(0)
			orb.queue_free()
			
		GameManager.deaths += 1
		dead = true
		bulletTracker = 0
		if dead:
			lives -= 1
			transform = startingTransform
		if lives > 0:
			dead = false
			health = maxHealth
		if lives <= 0:
			#GameManager.allowedDevices[playerNumber] = true
			GameManager.numberOfPlayers -= 1
			queue_free()
		
			
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
			animated_sprite_2d.play("slideGrey")
			
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
		#if laser2 != null:
		#	laser2.queue_free()
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
		

		
	if (Input.get_joy_axis(playerNumber, 4) or Input.is_joy_button_pressed(playerNumber, 0)) and (is_on_floor() or is_touching_wall) and jumpCounter < 1:
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
		#if playerNumber == 0:
		animated_sprite_2d.play("movingGrey")
		
	elif (direction < -0.05 or direction2 < -0.05) and crouching == false:
		animated_sprite_2d.flip_h = true
		energy_shield.position.x = -14
		energy_shield.scale.x = -1
		#energy_shield.energy_sprite.flip_h = true
		#health_outline.flip_h = true
		sprite_2d.flip_v = true
		weapon_sprite.flip_v = true
		velocity.x = direction * SPEED
		#if playerNumber == 0:
		animated_sprite_2d.play("movingGrey")

	elif crouching == false:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#print("stop")
		#if playerNumber == 0:
		animated_sprite_2d.play("idleGrey")

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
	

func _on_health_bar_timer_timeout()-> void:
	#print("hide health")
	health_bar.hide()

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


func _on_death_lasers_timer_timeout():
	health -= 2
	health_bar.show()
	health_bar_timer.start()
	death_lasers_timer.stop()


func _on_player_timer_timeout():
	ammo = maxAmmo
	reload.hide()
