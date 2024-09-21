extends Node2D
@onready var ammo_spawn = $ammoSpawn
@onready var bullet_speed_spawn = $bulletSpeedSpawn
@onready var health_spawn = $healthSpawn
@onready var increase_fire_rate_spawn = $increaseFireRateSpawn
@onready var add_damage_spawn = $addDamageSpawn

@onready var ammo_timer = $ammoSpawn/ammoTimer
@onready var bullet_speed_timer = $bulletSpeedSpawn/bulletSpeedTimer
@onready var health_timer = $healthSpawn/healthTimer
@onready var increase_fire_rate_timer = $increaseFireRateSpawn/increaseFireRateTimer
@onready var add_damage_timer = $addDamageSpawn/addDamageTimer

var add_ammo = null
var add_bullet_speed = null
var add_health_capacity = null
var increase_fire_rate = null
var add_damage = null


const ADD_AMMO_CAPACITY = preload("res://Scenes/powerUps/add_ammo_capacity.tscn")
const ADD_BULLET_SPEED = preload("res://Scenes/powerUps/add_bullet_speed.tscn")
const ADD_HEALTH_CAPACITY = preload("res://Scenes/powerUps/add_health_capacity.tscn")
const INCREASE_FIRE_RATE = preload("res://Scenes/powerUps/increase_fire_rate.tscn")
const ADD_DAMAGE = preload("res://Scenes/powerUps/add_damage.tscn")

func _ready():
	
	var a = ADD_AMMO_CAPACITY.instantiate()
	add_child(a)
	a.transform = ammo_spawn.transform
	add_ammo = a
	

	var b = ADD_BULLET_SPEED.instantiate()
	add_child(b)
	b.transform = bullet_speed_spawn.transform
	add_bullet_speed = b


	var h = ADD_HEALTH_CAPACITY.instantiate()
	add_child(h)
	h.transform = health_spawn.transform
	add_health_capacity = h
	

	var f = INCREASE_FIRE_RATE.instantiate()
	add_child(f)
	f.transform = increase_fire_rate_spawn.transform
	increase_fire_rate = f


	var d = ADD_DAMAGE.instantiate()
	add_child(d)
	d.transform = add_damage_spawn.transform
	add_damage = d

func _process(delta):
	
	print("testing", increase_fire_rate)
	print("testing2", add_ammo)
	if add_ammo == null:
		if ammo_timer.is_stopped():
			ammo_timer.start()
	
	if add_bullet_speed == null:
		if bullet_speed_timer.is_stopped():
			bullet_speed_timer.start()

	if add_health_capacity == null:
		if health_timer.is_stopped():
			health_timer.start()
			
	if increase_fire_rate == null:
		if increase_fire_rate_timer.is_stopped():
			increase_fire_rate_timer.start()
			
	if add_damage == null:
		if add_damage_timer.is_stopped():
			add_damage_timer.start()
	
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

func _on_health_timer_timeout():
	var h = ADD_HEALTH_CAPACITY.instantiate()
	add_child(h)
	h.transform = health_spawn.transform
	add_health_capacity = h
	
func _on_increase_fire_rate_timer_timeout():
	var f = INCREASE_FIRE_RATE.instantiate()
	add_child(f)
	f.transform = increase_fire_rate_spawn.transform
	increase_fire_rate = f

func _on_add_damage_timer_timeout():
	var d = ADD_DAMAGE.instantiate()
	add_child(d)
	d.transform = add_damage_spawn.transform
	add_damage = d
