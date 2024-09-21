extends Node

var numberOfPlayers := 0
var deaths := 0
var nextLevel := false
var allowDevice0 := true
var allowDevice1 := true
var allowDevice2 := true
var allowDevice3 := true
var allowedDevices = [allowDevice0,allowDevice1,allowDevice2,allowDevice3]
#var bullet = preload("res://Scenes/bullet.tscn")
#var bouncers = preload("res://Scenes/bouncers.tscn")
#var death_lasers = preload("res://Scenes/death_lasers.tscn")
var bullet = preload("res://Scenes/pickUps/bullet.tscn")
var bouncer = preload("res://Scenes/pickUps/bouncers.tscn")
var death_lasers = preload("res://Scenes/pickUps/death_lasers.tscn")
var the_orb = preload("res://Scenes/pickUps/the_orb.tscn")
var stealer = preload("res://Scenes/pickUps/stealer.tscn")
var bullets := [bullet, bouncer, death_lasers, the_orb, stealer]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		var devices = Input.get_connected_joypads()
		#print(devices)
		
		if deaths >= devices.size() -1:
			nextLevel = true
			
		#print(deaths)
		#print(devices.size())
		
