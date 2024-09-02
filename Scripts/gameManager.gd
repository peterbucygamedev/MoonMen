extends Node

var numberOfPlayers := 0
var player1BulletSpeed := 2000
var player1Damage := 1
var player1Health := 10
var player1MaxHealth := 10
var player1Ammo := 10
var player1MaxAmmo := 10
var player2BulletSpeed := 2000
var player2Damage := 1
var player2Health := 10
var player2MaxHealth := 10
var player2Ammo := 10
var player2MaxAmmo := 10
var player3BulletSpeed := 2000
var player3Damage := 1
var player3Health := 10
var player3MaxHealth := 10
var player3Ammo := 10
var player3MaxAmmo := 10
var player4BulletSpeed := 2000
var player4Damage := 1
var player4Health := 10
var player4MaxHealth := 10
var player4Ammo := 10
var player4MaxAmmo := 10
var deaths := 0
var nextLevel := false
var allowDevice0 := true
var allowDevice1 := true
var allowDevice2 := true
var allowDevice3 := true

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
		
