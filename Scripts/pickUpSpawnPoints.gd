extends Node2D
@onready var bullet_spawn = $bulletSpawn
@onready var bullet_pick_up_timer = $bulletSpawn/bulletPickUpTimer
@onready var bullet_pick_up = $bulletSpawn/bulletPickUP
const BULLET_PICKUP = preload("res://Scenes/pickUps/bullet_pickup.tscn")
@onready var bouncer_spawn = $bouncerSpawn
@onready var bouncer_pick_up_timer = $bouncerSpawn/bouncerPickUpTimer
@onready var bouncers_pickup = $bouncerSpawn/bouncersPickup
const BOUNCERS_PICKUP = preload("res://Scenes/pickUps/bouncers_pickup.tscn")
@onready var death_laser_spawn = $deathLaserSpawn
@onready var death_laser_pickup_timer = $deathLaserSpawn/deathLaserPickupTimer
@onready var death_lasers_pickup = $"../deathLaserSpawn/deathLasersPickup"
const DEATH_LASERS_PICKUP = preload("res://Scenes/pickUps/death_lasers_pickup.tscn")

func _process(delta):
	print ("bulletPickUp", bullet_pick_up)
	if  bullet_pick_up == null:
		if bullet_pick_up_timer.is_stopped():
			bullet_pick_up_timer.start()
			
	print ("bouncerPickUP", bouncers_pickup)		
	if  bouncers_pickup== null:
		if bouncer_pick_up_timer.is_stopped():
			bouncer_pick_up_timer.start()
	
	print ("deathLaserPickUp", death_lasers_pickup)
	if  death_lasers_pickup == null:
		if death_laser_pickup_timer.is_stopped():
			death_laser_pickup_timer.start()
			
func _on_bullet_pick_up_timer_timeout():
	var b = BULLET_PICKUP.instantiate()
	add_child(b)
	b.transform = bullet_spawn.transform
	bullet_pick_up = b
	#bullet_pick_up_timer.stop()
	
func _on_bouncer_pick_up_timer_timeout():
	var c = BOUNCERS_PICKUP.instantiate()
	add_child(c)
	c.transform = bouncer_spawn.transform
	bouncers_pickup = c
	#bouncer_pick_up_timer.stop()
	
func _on_death_laser_pickup_timer_timeout():
	var d = DEATH_LASERS_PICKUP.instantiate()
	add_child(d)
	d.transform = death_laser_spawn.transform
	death_lasers_pickup = d
	#death_laser_pickup_timer.stop()
