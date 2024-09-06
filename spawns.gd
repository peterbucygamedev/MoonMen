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
const ADD_AMMO_CAPACITY = preload("res://Scenes/powerUps/add_ammo_capacity.tscn")
const ADD_BULLET_SPEED = preload("res://Scenes/powerUps/add_bullet_speed.tscn")
const ADD_DAMAGE_TO_LASER = preload("res://Scenes/powerUps/add_damage_to_laser.tscn")
const ADD_HEALTH_CAPACITY = preload("res://Scenes/powerUps/add_health_capacity.tscn")
const ADD_REFLECTING_TO_LASER = preload("res://Scenes/powerUps/add_reflecting_to_laser.tscn")
const FULL_AUTO = preload("res://Scenes/powerUps/full_auto.tscn")

func _ready():
	var a = ADD_AMMO_CAPACITY.instantiate()
	add_child(a)
	a.transform = ammo_spawn.transform
	
func _on_ammo_timer_timeout():
	print("spawn ammo")
	var a = ADD_AMMO_CAPACITY.instantiate()
	add_child(a)
	a.transform = ammo_spawn.transform
	
"""func _on_bullet_speed_timer_timeout():
	var b = ADD_BULLET_SPEED.instantiate()


func _on_damage_timer_timeout():
	var d = ADD_DAMAGE_TO_LASER.instantiate()


func _on_health_timer_timeout():
	var h = ADD_HEALTH_CAPACITY.instantiate()

func _on_reflecting_timer_timeout():
	var r = ADD_REFLECTING_TO_LASER.can_instantiate()
	
func _on_full_auto_timer_timeout():
	var f = FULL_AUTO.instantiate()"""
	
#add damage one


