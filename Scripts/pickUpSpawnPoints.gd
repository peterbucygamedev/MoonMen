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
@onready var the_orb_spawn = $theOrbSpawn
@onready var the_orb_pick_up_timer = $theOrbSpawn/theOrbPickUpTimer
@onready var the_orb_pick_up = $theOrbSpawn/theOrbPickUp
const THE_ORB_PICK_UP = preload("res://Scenes/pickUps/the_orb_pick_up.tscn")
@onready var ginyu_gun_spawn = $ginyuGunSpawn
@onready var ginyu_gun_pick_up_timer = $ginyuGunSpawn/ginyuGunPickUpTimer
@onready var ginyu_gun_pick_up = $ginyuGunSpawn/ginyuGunPickUp
const GINYU_GUN_PICK_UP = preload("res://Scenes/pickUps/ginyu_gun_pick_up.tscn")


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
			
	print ("the_orb_pick_up", the_orb_pick_up)
	if  the_orb_pick_up == null:
		if the_orb_pick_up_timer.is_stopped():
			the_orb_pick_up_timer.start()
			
	print ("the_orb_pick_up", the_orb_pick_up)
	if  ginyu_gun_pick_up == null:
		if ginyu_gun_pick_up_timer.is_stopped():
			ginyu_gun_pick_up_timer.start()
			
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
	
func _on_the_orb_pick_up_timer_timeout():
	var t = THE_ORB_PICK_UP.instantiate()
	add_child(t)
	t.transform = the_orb_spawn.transform
	the_orb_pick_up = t
	#the_orb_pick_up_timer.stop()

func _on_ginyu_gun_pick_up_timer_timeout():
	var g = GINYU_GUN_PICK_UP.instantiate()
	add_child(g)
	g.transform = ginyu_gun_spawn.transform
	the_orb_pick_up = g
	#the_orb_pick_up_timer.stop()
