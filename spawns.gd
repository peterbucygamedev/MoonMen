extends Node2D
@onready var ammo_spawn = $ammoSpawn
@onready var bullet_speed_spawn = $bulletSpeedSpawn
@onready var damage_spawn = $damageSpawn
@onready var health_spawn = $healthSpawn
@onready var full_auto_spawn = $fullAutoSpawn
@onready var reflecting_spawn = $reflectingSpawn
@onready var ammo_timer = $ammoSpawn/ammoTimer
@onready var bullet_speed_timer = $bulletSpeedSpawn/bulletSpeedTimer
@onready var damage_timer = $damageSpawn/damageTimer
@onready var health_timer = $healthSpawn/healthTimer
@onready var full_auto_timer = $fullAutoSpawn/fullAutoTimer
@onready var reflecting_timer = $reflectingSpawn/reflectingTimer
@onready var add_ammo = $ammoSpawn/addAmmo
@onready var add_bullet_speed = $bulletSpeedSpawn/addBulletSpeed
@onready var add_damage_to_laser = $damageSpawn/addDamageToLaser
@onready var add_health_capacity = $healthSpawn/addHealthCapacity
@onready var add_reflecting_to_laser = $reflectingSpawn/addReflectingToLaser
@onready var add_full_auto = $fullAutoSpawn/addFullAuto



const ADD_AMMO_CAPACITY = preload("res://Scenes/powerUps/add_ammo_capacity.tscn")
const ADD_BULLET_SPEED = preload("res://Scenes/powerUps/add_bullet_speed.tscn")
const ADD_DAMAGE_TO_LASER = preload("res://Scenes/powerUps/add_damage_to_laser.tscn")
const ADD_HEALTH_CAPACITY = preload("res://Scenes/powerUps/add_health_capacity.tscn")
const ADD_REFLECTING_TO_LASER = preload("res://Scenes/powerUps/add_reflecting_to_laser.tscn")
const FULL_AUTO = preload("res://Scenes/powerUps/full_auto.tscn")

func _process(delta):
	if add_ammo == null:
		if ammo_timer.is_stopped():
			ammo_timer.start()
	
	if add_bullet_speed == null:
		if bullet_speed_timer.is_stopped():
			bullet_speed_timer.start()
			
	if add_damage_to_laser == null:
		if damage_timer.is_stopped():
			damage_timer.start()
			
	if add_health_capacity == null:
		if health_timer.is_stopped():
			health_timer.start()
			
	if add_reflecting_to_laser == null:
		if reflecting_timer.is_stopped():
			reflecting_timer.start()
			
	if add_full_auto == null:
		if full_auto_timer.is_stopped():
			full_auto_timer.start()
			
	
			

func _on_ammo_timer_timeout():
	var a = ADD_AMMO_CAPACITY.instantiate()
	add_child(a)
	a.transform = ammo_spawn.transform
	add_ammo = a
	
func _on_bullet_speed_timer_timeout():
	var b = ADD_BULLET_SPEED.instantiate()
	add_child(b)
	b.transform = bullet_speed_spawn.transform
	add_bullet_speed = b

func _on_damage_timer_timeout():
	var d = ADD_DAMAGE_TO_LASER.instantiate()
	add_child(d)
	d.transform = damage_spawn.transform
	add_damage_to_laser = d

func _on_health_timer_timeout():
	var h = ADD_HEALTH_CAPACITY.instantiate()
	add_child(h)
	h.transform = health_spawn.transform
	add_health_capacity = h
	
func _on_reflecting_timer_timeout():
	var r = ADD_REFLECTING_TO_LASER.can_instantiate()
	add_child(r)
	r.transform = reflecting_spawn.transform
	add_reflecting_to_laser = r
	
func _on_full_auto_timer_timeout():
	var f = FULL_AUTO.instantiate()
	add_child(f)
	f.transform = full_auto_spawn.transform
	add_full_auto = f



