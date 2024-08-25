extends Node

var numberOfPlayers := 0
var player1Speed := 750
var player1Damage := 1
var player1Health := 10
var player1Ammo := 10
var player2Speed := 750
var player2Damage := 1
var player2Health := 10
var player2Ammo := 10
var player3Speed := 750
var player3Damage := 1
var player3Health := 10
var player3Ammo := 10
var player4Speed := 750
var player4Damage := 1
var player4Health := 10
var player4Ammo := 10
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
		
