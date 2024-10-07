extends Node2D
@onready var bullet_spawn = $bulletSpawn
@onready var bullet_pick_up_timer = $bulletSpawn/bulletPickUpTimer
var bullet_pick_up = null
const BULLET_PICKUP = preload("res://Scenes/pickUps/bullet_pickup.tscn")
@onready var bouncer_spawn = $bouncerSpawn
@onready var bouncer_pick_up_timer = $bouncerSpawn/bouncerPickUpTimer
var bouncers_pickup = null
const BOUNCERS_PICKUP = preload("res://Scenes/pickUps/bouncers_pickup.tscn")
@onready var death_laser_spawn = $deathLaserSpawn
@onready var death_laser_pickup_timer = $deathLaserSpawn/deathLaserPickupTimer
var death_lasers_pickup = null
const DEATH_LASERS_PICKUP = preload("res://Scenes/pickUps/death_lasers_pickup.tscn")
@onready var the_orb_spawn = $theOrbSpawn
@onready var the_orb_pick_up_timer = $theOrbSpawn/theOrbPickUpTimer
var the_orb_pick_up = null
const THE_ORB_PICK_UP = preload("res://Scenes/pickUps/the_orb_pick_up.tscn")
@onready var stealer_spawn = $stealerSpawn
@onready var stealer_pick_up_timer = $stealerSpawn/stealerPickUpTimer
var stealer_pick_up = null
const STEALER_PICKUP = preload("res://Scenes/pickUps/stealer_pickup.tscn")


func _ready():
	
	if GameManager.pickUpsOn== false:
		queue_free()

	var b = BULLET_PICKUP.instantiate()
	add_child(b)
	b.transform = bullet_spawn.transform
	bullet_pick_up = b
	#bullet_pick_up_timer.stop()
	

	var c = BOUNCERS_PICKUP.instantiate()
	add_child(c)
	c.transform = bouncer_spawn.transform
	bouncers_pickup = c
	#bouncer_pick_up_timer.stop()
	

	var d = DEATH_LASERS_PICKUP.instantiate()
	add_child(d)
	d.transform = death_laser_spawn.transform
	death_lasers_pickup = d
	#death_laser_pickup_timer.stop()
	

	var t = THE_ORB_PICK_UP.instantiate()
	add_child(t)
	t.transform = the_orb_spawn.transform
	the_orb_pick_up = t
	#the_orb_pick_up_timer.stop()
	
	var s = STEALER_PICKUP.instantiate()
	add_child(s)
	s.transform = stealer_spawn.transform
	stealer_pick_up = s
	#stealer_pick_up_timer.stop()


	
	
	
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
			
	print ("stealer_pick_up", stealer_pick_up)
	if  stealer_pick_up == null:
		if stealer_pick_up_timer.is_stopped():
			stealer_pick_up_timer.start()
			

			
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

func _on_stealer_pick_up_timer_timeout():
	var s = STEALER_PICKUP.instantiate()
	add_child(s)
	s.transform = stealer_spawn.transform
	stealer_pick_up = s
	#stealer_pick_up_timer.stop()
